import { Elysia } from "elysia";
import { cors } from "@elysiajs/cors";
import { folderService } from "./services/folderService";

const app = new Elysia()
  .use(cors())
  .get("/api/folders", async () => {
    try {
      const data = await folderService.getFolderTree();
      return { status: "success", data };
    } catch (error) {
      console.error(error);
      return { status: "error", message: "Gagal mengambil data" };
    }
  })
  .listen(3000);

console.log(`🦊 Backend is running at ${app.server?.hostname}:${app.server?.port}`);