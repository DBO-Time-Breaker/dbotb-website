<p align="center">
  <a href="https://dbotimebreaker.com/">
    <img width="300" alt="DBOTB" src="app/assets/images/logo.png">
  </a>
</p>

<h1 align="center">DBO Time Breaker Website</h1>

## Setup Instructions

### Getting Started

1. **Clone Repository:**

   - Clone the repository using Git:

     ```bash
     git clone git@github.com:DBO-Time-Breaker/dbotb-website.git
     ```

2. **Set .env:**

   - Rename `.env.sample` to `.env` and fill it out with your environment variables.

3. **Install Dependencies:**

   - Download Ruby from [here](https://www.ruby-lang.org/en/downloads/) and install it locally.
   - Run `gem install rails` to install Rails locally.
   - Run `gem install mysql2` to install the MySQL connector. For Windows users, download the MariaDB connector from [here](https://mega.nz/file/MsIWASrC#ZwzhlaTPtTk1I8b6sjuJiz4GsE3yn-B9_qQTydMr0EA), extract it, and run:

     ```bash
     gem install mysql2 --platform=ruby -- --with-mysql-dir="path\to\mariadb-connector-c-3.2.7-src"
     ```

   - Finally, run `bundle install` in the project's root folder to install all project dependencies.
   - Modify the header content to reflect your server's branding. Update any relevant text, logos, or branding elements.

4. **Set up Database:**

   - This server expects the DBO 2.0 database structure, so you need to set that up separately. Besides that, this website also has its own database for logging purposes. To set it up, run:

     ```bash
     rake db:create:primary
     rake db:migrate:primary
     ```

5. **Start Project:**

   - To run the project in development mode, simply execute `rails s`. For the release mode, use `rails s -e production`.

## Current Features

### Public

- Account Registration
- Searchable Ranking:
  - Players
  - Guilds
  - Budokai Solo
  - Budokai Party

### Users

- Log in
- Email and Password Update
- Character Listing

### Admins (Level 10 admins)

- Dashboard with General Information
- Searchable Account Listing
- Searchable Characters Listing
- Player Actions:
  - Add Cash Points
  - Ban

## Links

- [Website](https://dbotimebreaker.com/)
- [Discord](https://discord.gg/CAgQSfB3Zm)
- [Organization](https://github.com/DBO-Time-Breaker)

## License

[MIT](LICENSE)
