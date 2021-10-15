
FROM openjdk:8

COPY . /usr/src/mcserver/mods

WORKDIR /usr/src/mcserver

RUN wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2855/forge-1.12.2-14.23.5.2855-installer.jar
RUN java -jar forge-1.12.2-14.23.5.2855-installer.jar --install
RUN echo "eula=true" > eula.txt

CMD ["java","-Xmx4096M","-Xmx4096M","-jar","forge-1.12.2-14.23.5.2855.jar","nogui"]
