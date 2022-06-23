# 设置本镜像需要使用的基础镜像
FROM  java:8  
  
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#RUN mkdir -p /usr/local/jar/lib

# 把jar包添加到镜像中
ADD target/ilab4cloud-config-1.0-SNAPSHOT.jar /usr/local/jar/
 
# 镜像暴露的端口
EXPOSE 8899
 
#RUN bash -c 'touch /app.jar'
  
# 容器启动命令
ENTRYPOINT ["java","-Xms1024m","-Xmx1024m","-jar","-Dloader.path=/usr/local/jar/lib","-Dfile.encoding=utf-8","/usr/local/jar/ilab4cloud-config-1.0-SNAPSHOT.jar"]
 
# 设置时区
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
 