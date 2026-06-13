<template>
  <div class="app-wrapper">
    <aside class="sidebar">
      <div class="sidebar-header">Rian Explorer</div>
      <div class="sidebar-content">
        <FolderItem 
          v-for="f in folders" 
          :key="f.id" 
          :folder="f" 
          :activeId="selected?.id"
          @select="handleSelect" 
        />
      </div>
    </aside>

    <main class="main-panel">
      <header class="main-header">
        <div class="breadcrumb">
          <span @click="navigateToRoot">My Computer</span>
          <template v-for="node in breadcrumbPath" :key="node.id">
            <span style="color: #475569;">/</span>
            <span @click="handleSelect(node)">{{ node.name }}</span>
          </template>
        </div>
        
        <div class="controls">
          <input v-model="searchQuery" placeholder="Search item..." class="search-input" />
          
          <select v-model="sortOption" class="search-input" style="cursor: pointer;">
            <option value="name-asc">Name (A-Z)</option>
            <option value="name-desc">Name (Z-A)</option>
            <option value="date-desc">Newest First</option>
            <option value="date-asc">Oldest First</option>
          </select>

          <button class="btn-view" :class="{ active: viewMode === 'grid' }" @click="viewMode = 'grid'">⊞</button>
          <button class="btn-view" :class="{ active: viewMode === 'list' }" @click="viewMode = 'list'">≣</button>
        </div>
      </header>

      <p v-if="selected" style="color: #94a3b8; margin-bottom: 1rem;">
        {{ filteredChildren.length }} Folders, {{ filteredFiles.length }} Files
      </p>

      <div v-if="hasContent" :class="viewMode === 'grid' ? 'grid-view' : 'list-view'">
        
        <div v-for="child in filteredChildren" :key="'dir-'+child.id" class="card" @click="handleSelect(child)">
          <div class="item-icon">📁</div>
          <span class="item-name">{{ child.name }}</span>
        </div>
        
        <div v-for="file in filteredFiles" :key="'file-'+file.id" class="card">
          <div class="item-icon">{{ getFileIcon(file.name) }}</div>
          <span class="item-name">{{ file.name }}</span>
          
          <div class="tooltip-box">
            <strong>Type:</strong> {{ file.type || 'Unknown' }} <br/>
            <strong>Size:</strong> {{ file.size || 'Unknown' }} <br/>
            <span style="color: #94a3b8; font-size: 0.7rem; display: block; margin-top: 4px;">
              📅 {{ formatDate(file.created_at) }}
            </span>
          </div>
        </div>

      </div>

      <div v-else class="empty-state">
        <div style="font-size: 3rem; margin-bottom: 10px;">📭</div>
        <h3>Folder ini kosong</h3>
        <p>Tidak ada file atau sub-folder yang ditemukan.</p>
      </div>

    </main>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import FolderItem from './components/FolderItem.vue';
import './assets/css/explorer.css';

const folders = ref([]);
const selected = ref(null);
const viewMode = ref('grid');
const searchQuery = ref('');
const sortOption = ref('name-asc'); 
const breadcrumbPath = ref([]);

const getFileIcon = (filename) => {
  const ext = filename.split('.').pop().toLowerCase();
  if (['pdf'].includes(ext)) return '📕';
  if (['doc', 'docx'].includes(ext)) return '📘';
  if (['xls', 'xlsx'].includes(ext)) return '📗';
  if (['jpg', 'jpeg', 'png', 'gif'].includes(ext)) return '🖼️';
  if (['zip', 'rar'].includes(ext)) return '🗜️';
  if (['txt'].includes(ext)) return '📝';
  return '📄';
};

const formatDate = (dateString) => {
  if (!dateString) return '-';
  const date = new Date(dateString);
  return date.toLocaleDateString('id-ID', { 
    day: 'numeric', month: 'short', year: 'numeric',
    hour: '2-digit', minute: '2-digit'
  });
};

const findPath = (tree, targetId, currentPath = []) => {
  for (const node of tree) {
    if (node.id === targetId) return [...currentPath, node];
    if (node.children) {
      const found = findPath(node.children, targetId, [...currentPath, node]);
      if (found) return found;
    }
  }
  return null;
};

const handleSelect = (folder) => {
  selected.value = folder;
  searchQuery.value = '';
  breadcrumbPath.value = findPath(folders.value, folder.id) || [folder];
};

const navigateToRoot = () => {
  selected.value = null;
  breadcrumbPath.value = [];
  searchQuery.value = '';
};

const sortItems = (items) => {
  return items.sort((a, b) => {
    switch (sortOption.value) {
      case 'name-asc':
        return a.name.localeCompare(b.name);
      case 'name-desc':
        return b.name.localeCompare(a.name);
      case 'date-asc':
        return new Date(a.created_at || 0) - new Date(b.created_at || 0);
      case 'date-desc':
        return new Date(b.created_at || 0) - new Date(a.created_at || 0);
      default:
        return 0;
    }
  });
};

const filteredChildren = computed(() => {
  let items = selected.value ? (selected.value.children || []) : folders.value;
  if (searchQuery.value) {
    items = items.filter(item => item.name.toLowerCase().includes(searchQuery.value.toLowerCase()));
  }
  return sortItems([...items]);
});

const filteredFiles = computed(() => {
  let items = selected.value ? (selected.value.files || []) : [];
  if (searchQuery.value) {
    items = items.filter(item => item.name.toLowerCase().includes(searchQuery.value.toLowerCase()));
  }
  return sortItems([...items]);
});

const hasContent = computed(() => {
  return filteredChildren.value.length > 0 || filteredFiles.value.length > 0;
});

onMounted(async () => {
  try {
    const res = await fetch('http://localhost:3000/api/folders');
    const { data } = await res.json();
    folders.value = data;
  } catch (error) {
    console.error("Gagal mengambil data", error);
  }
});
</script>