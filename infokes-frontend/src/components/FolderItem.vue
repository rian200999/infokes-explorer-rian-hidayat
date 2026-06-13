<template>
  <div class="folder-node">
    <div 
      class="folder-label" 
      :class="{ active: folder.id === activeId }"
      @click.stop="toggle"
    >
      <!-- Panah hanya muncul jika ada sub-folder -->
      <span v-if="folder.children && folder.children.length > 0" class="arrow" :class="{ open: isOpen }">▶</span>
      <span v-else style="width: 12px; display: inline-block;"></span>
      
      <span>{{ isOpen ? '📂' : '📁' }} {{ folder.name }}</span>
    </div>

    <!-- Recursive Call -->
    <div v-if="isOpen && folder.children?.length" class="children-container" style="margin-left: 15px; border-left: 1px solid #334155;">
      <FolderItem 
        v-for="child in folder.children" 
        :key="child.id" 
        :folder="child"
        :activeId="activeId"
        @select="$emit('select', $event)"
      />
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const props = defineProps(['folder', 'activeId']);
const emit = defineEmits(['select']);

const isOpen = ref(false);

const toggle = () => {
  isOpen.value = !isOpen.value; // Buka/tutup folder di sidebar
  emit('select', props.folder); // Beritahu App.vue folder mana yang diklik
};
</script>