# Infokes Explorer - Technical Test - Rian Hidayat

Online Assessment for **Full Stack Developer / Software Engineer** position at **PT Infokes Indonesia**. 

A Windows Explorer-like web application built with Vue 3 and ElysiaJS (Bun).

## 🚀 Features
* **Recursive Folder Tree:** Dedicated recursive component implementation.
* **Smart Breadcrumb:** Dynamic pathfinding with horizontal overflow handling.
* **View Modes:** Toggle between Grid and List views.
* **Dynamic Sorting:** Sort by Name or Date.

## 🏗️ Architecture
* **Backend:** Service-Repository pattern (Clean Architecture).
* **Frontend:** Modular CSS with Flexbox optimizations.

## ⚙️ How to Run

### 1. Database Setup
1. Create a MySQL database named `infokes_explorer`.
2. Import the SQL file located in `infokes-backend/database/infokes_explorer.sql` via phpMyAdmin or your preferred SQL client.

### 2. Backend
1. `cd infokes-backend`
2. `bun install`
3. Copy `.env.example` to `.env` and adjust database credentials.
4. `bun run dev` (Runs on http://localhost:3000)

### 3. Frontend
1. `cd infokes-frontend`
2. `npm install`
3. `npm run dev` (Runs on http://localhost:5173)