import app from "./app.ts";
import { PORT } from "./config/env.config.ts";
import { sql } from "./config/db.config.ts";

app.listen(PORT, () => {
    console.log("Server is running on port http://localhost:" + PORT);
});