
FROM openjdk:8

COPY . /usr/src/mcserver/mods

WORKDIR /usr/src/mcserver

RUN wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2855/forge-1.12.2-14.23.5.2855-installer.jar
RUN java -jar forge-1.12.2-14.23.5.2855-installer.jar --install
RUN echo "eula=true" > eula.txt
RUN echo "max-tick-time=60000\ngenerator-settings=\nallow-nether=true\nforce-gamemode=false\ngamemode=3\nenable-query=false\nplayer-idle-timeout=0\ndifficulty=0\nspawn-monsters=true\nop-permission-level=4\npvp=true\nsnooper-enabled=true\nlevel-type=DEFAULT\nhardcore=false\nenable-command-block=false\nmax-players=6\nnetwork-compression-threshold=256\nresource-pack-sha1=\nmax-world-size=29999984\nserver-port=25565\nserver-ip=\nspawn-npcs=true\nallow-flight=true\nlevel-name=world\nview-distance=10\nresource-pack=\nspawn-animals=true\nwhite-list=false\ngenerate-structures=true\nonline-mode=false\nmax-build-height=256\nlevel-seed=\nprevent-proxy-connections=false\nuse-native-transport=true\nmotd=A\nMinecraft\nServern enable-rcon=false\nspawn-protection=0" > server.properties
RUN chmod a=r server.properties
CMD ["java","-Xmx4096M","-Xmx4096M","-jar","forge-1.12.2-14.23.5.2855.jar","-Dfml.queryResult=confirm","nogui"]
