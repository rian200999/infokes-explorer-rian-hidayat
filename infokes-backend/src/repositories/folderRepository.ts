import { pool } from "../db";

export const folderRepository = {
    async findAll() {
        const [rows] = await pool.query("SELECT * FROM folders");
        return rows;
    }
};