# Infokes Explorer - Technical Test

Online Assessment for **Full Stack Developer / Software Engineer** position at **PT Infokes Indonesia**. 

A Windows Explorer-like web application built with Vue 3 (Composition API) and ElysiaJS (Bun), implementing recursive folder structures, dynamic routing paths, and Clean Architecture principles.

## 🚀 Features
* **Recursive Folder Tree:** Built from scratch using a dedicated recursive Vue component without third-party libraries.
* **Smart Breadcrumb Navigation:** Dynamic pathfinding algorithm from root to deep nested folders with horizontal overflow handling.
* **View Modes:** Toggle between Grid and List views seamlessly.
* **Dynamic Sorting:** Sort folders and files by Name (A-Z/Z-A) or Date (Newest/Oldest).
* **Advanced Tooltips:** Aesthetic tooltips revealing file type, size, and formatted creation dates.

## 🏗️ Architecture & Best Practices
* **Backend:** Follows Service-Repository pattern (Clean Architecture) and SOLID principles, separating database access (`repository`) from business logic (`service`).
* **Frontend:** Modular CSS approach with Flexbox optimizations to prevent layout breakage on deep nested paths.
* **Database:** Relational database structure handling unlimited levels of sub-folders and file associations.

## ⚙️ How to Run

### 1. Database Setup
1. Create a MySQL database named `infokes_explorer`.
2. Import the provided `database/infokes_explorer.sql` file.

### 2. Backend (ElysiaJS / Bun)
1. Open terminal in the backend directory.
2. Install dependencies: `bun install`
3. Set up environment: Copy `.env.example` to `.env` and adjust your database credentials.
4. Run server: `bun run dev`
*(Server will run on http://localhost:3000)*

### 3. Frontend (Vue 3 / Vite)
1. Open terminal in the frontend directory.
2. Install dependencies: `npm install`
3. Run development server: `npm run dev`

### 4. Database Setup
1. Create a MySQL database named `infokes_explorer`.
2. **Import Data:** Import the SQL file located in `database/infokes_explorer.sql` into your newly created database via phpMyAdmin or your preferred SQL client.