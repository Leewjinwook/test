FROM adoptopenjdk/openjdk8

ARG HOST_JAR_FILE_PATH=./ROOT-1.jar # Jar 경로 환경변수 설정.
CMD ["echo","$HOST_JAR_FILE_PATH"]
COPY /var/lib/jenkins/workspace/test/target/ROOT-1.jar ./ # Maven을 통해 패키징된 Jar을 Docker image에 포함시킨다.

# 해당 Docker image로 Container를 생성/실행하는 시점에 아래의 커맨드가 수행되도록한다.
CMD ["java", "-Dspring.profiles.active={e.g. beta, release}", "-jar", "./ROOT-1.jar"]
