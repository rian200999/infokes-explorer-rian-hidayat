import { pool } from "../db";

export const fileRepository = {
    async findAll() {
        const [rows] = await pool.query("SELECT * FROM files");
        return rows;
    }
};