/* Users */
CREATE TABLE "Users"(
    "id" BIGINT NOT NULL,
    "username" VARCHAR(30) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "avatar" VARCHAR(255) NULL,
    "bio" VARCHAR(255) NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Users" ADD PRIMARY KEY("id");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_username_unique" UNIQUE("username");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_email_unique" UNIQUE("email");

/* Platforms */
CREATE TABLE "Platforms"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "display_name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Platforms" ADD PRIMARY KEY("id");

/* Users_Platforms */
CREATE TABLE "Users_Platforms"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "platform_id" BIGINT NOT NULL,
    "external_user_id" BIGINT NOT NULL,
    "access_token" VARCHAR(255) NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Users_Platforms" ADD PRIMARY KEY("id");
ALTER TABLE
    "Users_Platforms" ADD CONSTRAINT "users_platforms_user_id_unique" UNIQUE("user_id");
ALTER TABLE
    "Users_Platforms" ADD CONSTRAINT "users_platforms_platform_id_unique" UNIQUE("platform_id");

/* Games */
CREATE TABLE "Games"(
    "id" BIGINT NOT NULL,
    "platform_id" BIGINT NOT NULL,
    "external_game_id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "icon" VARCHAR(255) NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Games" ADD PRIMARY KEY("id");
ALTER TABLE
    "Games" ADD CONSTRAINT "games_platform_id_unique" UNIQUE("platform_id");
ALTER TABLE
    "Games" ADD CONSTRAINT "games_external_game_id_unique" UNIQUE("external_game_id");

/* Achievements */
CREATE TABLE "Achievements"(
    "id" BIGINT NOT NULL,
    "game_id" BIGINT NOT NULL,
    "external_achievement_id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "exp" BIGINT NULL,
    "icon" VARCHAR(255) NULL
);
ALTER TABLE
    "Achievements" ADD PRIMARY KEY("id");
ALTER TABLE
    "Achievements" ADD CONSTRAINT "achievements_game_id_unique" UNIQUE("game_id");

/* User_Achievements */
CREATE TABLE "user_achievements"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "achievement_id" BIGINT NOT NULL,
    "is_unlocked" BOOLEAN NOT NULL,
    "unlocked_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL
);
ALTER TABLE
    "user_achievements" ADD PRIMARY KEY("id");
ALTER TABLE
    "user_achievements" ADD CONSTRAINT "user_achievements_user_id_unique" UNIQUE("user_id");
ALTER TABLE
    "user_achievements" ADD CONSTRAINT "user_achievements_achievement_id_unique" UNIQUE("achievement_id");
ALTER TABLE
    "Users_Platforms" ADD CONSTRAINT "users_platforms_platform_id_foreign" FOREIGN KEY("platform_id") REFERENCES "Platforms"("id");
ALTER TABLE
    "Users_Platforms" ADD CONSTRAINT "users_platforms_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("id");
ALTER TABLE
    "user_achievements" ADD CONSTRAINT "user_achievements_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("id");
ALTER TABLE
    "Achievements" ADD CONSTRAINT "achievements_game_id_foreign" FOREIGN KEY("game_id") REFERENCES "Games"("id");
ALTER TABLE
    "Games" ADD CONSTRAINT "games_platform_id_foreign" FOREIGN KEY("platform_id") REFERENCES "Platforms"("id");
ALTER TABLE
    "user_achievements" ADD CONSTRAINT "user_achievements_achievement_id_foreign" FOREIGN KEY("achievement_id") REFERENCES "Achievements"("id");