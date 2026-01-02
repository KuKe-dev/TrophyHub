import { loadEnvFile } from "node:process";

loadEnvFile();

const PORT: number  = parseInt(process.env.PORT || "3000", 10);

const DATABASE_HOST: string = process.env.DATABASE_HOST || "localhost";
const DATABASE_NAME: string = process.env.DATABASE_NAME || "postgres";
const DATABASE_USER: string = process.env.DATABASE_USER || "postgres";
const DATABASE_PASSWORD: string = process.env.DATABASE_PASSWORD || "postgres";

export { PORT };
export { DATABASE_HOST, DATABASE_NAME, DATABASE_USER, DATABASE_PASSWORD };
