进入项目路径，在控制台输入：   mvn clean compile jetty:run
打开浏览器地址：   http://localhost:8080/login.jsp
用户名为customer表中的first_name，密码不为空即可
即使输入了空值，在不能为空的地方，也会有js弹出提示
ps：
由于还没有学习bootstrap，因此本项目中只用到了很少量的Bootstrap
删除功能直接删除，然后返回index的第一页
数据库配置文件在src/main/resource下的dbconfig.properties