class User {

    constructor(
        public id: number,
        public username: string,
        public email: string,
        public password: string,
        public avatar: string,
        public bio: string,
        public created_at: Date,
        public updated_at: Date
    ) {}

    getId(): number {
        return this.id;
    }

    getUsername(): string {
        return this.username;
    }

    getEmail(): string {
        return this.email;
    }

    checkPassword(password: string): boolean {
        return this.password === password;
    }

    getAvatar(): string {
        return this.avatar;
    }

    getBio(): string {
        return this.bio;
    }

}