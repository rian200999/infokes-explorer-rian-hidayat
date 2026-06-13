import { folderRepository } from "../repositories/folderRepository";
import { fileRepository } from "../repositories/fileRepository";

export const folderService = {
    async getFolderTree() {
        // 1. Ambil data mentah dari masing-masing Repository
        const folders = await folderRepository.findAll() as any[];
        const files = await fileRepository.findAll() as any[];

        // 2. Algoritma pembentuk Tree dan penyisipan File
        function buildTree(data: any[], parentId: number | null = null): any[] {
            return data
                .filter(folder => folder.parent_id === parentId)
                .map(folder => ({
                    ...folder,
                    children: buildTree(data, folder.id),
                    // Masukkan file yang folder_id-nya cocok dengan id folder ini
                    files: files.filter(file => file.folder_id === folder.id)
                }));
        }

        // 3. Return hasilnya dari parentId paling atas (null)
        return buildTree(folders);
    }
};