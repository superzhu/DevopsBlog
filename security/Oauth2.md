# OAuth 2.0 and JWT

1. JWT can be chosen **as the format for access and refresh tokens** used inside the OAuth2 protocol. 可以选择JWT作为OAuth2协议内部使用的访问和刷新令牌的格式。
2. **issuer and audience : 发行方和受众**
3. **Scope** & Access Control : [Google- highly structured and predictable OAuth Scopes](https://developers.google.com/identity/protocols/googlescopes)
4. **Claims Management** :  A **claim声明** is simply the name/value pair embedded within our Access and ID Tokens. 
5. [OIDC 协议及其在 Kubernetes 中的运用](https://blog.hdls.me/15626607670408.html)
6. The traditional way of dealing with this is the use of **Server Side Session (SSS)**.
7. JWT token is **self-contained**, this means it contains all information needed to allow or deny any given requests to an API.

## Spring Security
1. [Using Spring Boot for OAuth2 and JWT REST Protection](https://www.toptal.com/spring/spring-boot-oauth2-jwt-rest-protection) Great
2. [What is OAuth 2.0 ? How it Works ?](https://cybersecuritynews.com/oauth-2-0/)
3. [OAuth 2.0 技术选型难题解析（附一整套代码）](https://mp.weixin.qq.com/s?__biz=MjM5MDE0Mjc4MA==&mid=2651033048&idx=1&sn=cc6c72f61898d79c69b47f648e233c8a&chksm=bdbe758b8ac9fc9d264a5129679e735ce710a592fc682c618d9276f204247e4f25984700865e&scene=126&sessionid=1593478218&key=7fa4c9207b4feb1fc603552ab0514403d1449dc495807c72b9f9c09b4b7b6ec2351dc2094df184431caa285428f34cf6abcb2ece6d4fe6de0c87a37ceaf03980cbd924a7f3c7ab586585a7eeaab76ecc&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=62090523&lang=zh_CN&exportkey=A%2BISaFvBEyLUajRy1I1KhDE%3D&pass_ticket=X1NXfSXdWY8wbHoeD95KAXa3TsQ0vV19VwxAHDkohucskxqEeyWGstf%2FYxHx%2FLTZ)
4. [project-example-springboot-oauth2-rbac](https://github.com/mupezzuol/project-example-springboot-oauth2-rbac)
5. [Understanding OAuth 2.0 and OpenID Connect](https://blog.runscope.com/posts/understanding-oauth-2-and-openid-connect) 重要
6. [OAuth 2.0与OpenID Connect协议的完整指南](https://cloud.tencent.com/developer/news/661655)
7. [Why do we need the JSON Web Token (JWT) in the modern web](https://medium.com/swlh/why-do-we-need-the-json-web-token-jwt-in-the-modern-web-8490a7284482)
