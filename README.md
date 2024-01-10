# 🐋☕️⚡️ Docker image for TShock
- Self-updating TShock Docker image.
- Gets the latest version of TShock and installs it.

# 🤓 Usage
- Download the [`docker-compose.yml`](https://raw.githubusercontent.com/barbarbar338/tshock-docker/main/dockerfile-compose.yml) file.
```yml
version: "3.8"

name: ncfs-terraria-complex

networks:
    ncfs-terraria-net:

# You can use docker volumes or bind mounts
volumes:
    tshock-data:
    worlds-data:
    plugins-data:

services:
    terraria:
        image: barbarbar338/tshock:buildx-latest
        container_name: terraria
        restart: unless-stopped
        ports:
            - 7777:7777 # Terraria port
            - 7878:7878 # TShock REST API port
        volumes:
            - tshock-data:/tshock
            - worlds-data:/worlds
            - plugins-data:/plugins
        networks:
            - ncfs-terraria-net
        environment:
            WORLDNAME: myworld
            MOTD: TShock on Docker!
            DIFFICULTY: 0
            AUTOCREATE: 1

    # You can also use NCFS to expose your server to the internet
    # this part is not required, you can remove it if you don't want to use NCFS
    ncfs:
        image: barbarbar338/ncfs:buildx-latest 
        container_name: ncfs
        restart: unless-stopped
        depends_on:
            - terraria
        ports:
            - 4040:4040
        networks:
            - ncfs-terraria-net
        environment:
            NGROK_TCP_PORT: 7777
            NGROK_AUTH_TOKEN: <Your NGROK auth token here>
            CLOUDFLARE_AUTH_EMAIL: <Your Cloudflare email here>
            CLOUDFLARE_API_KEY: <Your Cloudflare Global API key here>
            CLOUDFLARE_ZONE_ID: <Your domain's Cloudflare Zone ID here>
            CLOUDFLARE_CNAME_RECORD_NAME: server.example.com
            CLOUDFLARE_SRV_RECORD_NAME: play.example.com
            CLOUDFLARE_SRV_RECORD_PREIX: _terraria._tcp
```
- Edit the `docker-compose.yml` file to your liking.
- Run `docker-compose up -d` in the same directory as the `docker-compose.yml` file.
- The server will be available on port `7777` by default.

# 🧦 Contributing

Feel free to use GitHub's features.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/my-feature`)
3. Commit your Changes (`git commit -m 'my awesome feature my-feature'`)
4. Push to the Branch (`git push origin feature/my-feature`)
5. Open a Pull Request

# 🔥 Show your support

Give a ⭐️ if this project helped you!

# 📞 Contact

- Mail: hi@338.rocks
- Discord: https://discord.gg/BjEJFwh
