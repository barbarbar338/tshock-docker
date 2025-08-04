# 🐋☕️⚡️ Docker image for TShock
- Self-updating TShock Docker image.
- Gets the latest version of TShock and installs it.

# 🤓 Usage
```yml
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
        environment:
            WORLDNAME: myworld
            MOTD: TShock on Docker!
            DIFFICULTY: 0
            AUTOCREATE: 1
```

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
