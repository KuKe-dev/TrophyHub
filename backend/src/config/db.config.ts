import postgres from "postgres";

import { DATABASE_HOST, DATABASE_NAME, DATABASE_USER, DATABASE_PASSWORD } from "./env.config.ts";

export const sql = postgres({
    host: DATABASE_HOST,
    port: 5432,
    database: DATABASE_NAME,
    username: DATABASE_USER,
    password: DATABASE_PASSWORD,
});