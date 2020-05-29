# Istio Security
1. JWTs in a Nutshell: Header, Payload, Signature . The content of the JWT Payload is then validated by the receiver by **inspecting the signature**. But there are multiple types of signatures, so one of the things that the receiver needs to know is for example which type of signature to look for
2.  Message Authentication Code : 消息验证码
3.  **RS256 signatures use a particular type of keys, called RSA Keys**. RSA is the name of an encryption/decryption algorithm that takes one key to encrypt and a second key to decrypt.
4.  Another common security related use for JWTs if **Authorization**: we can for example put in the Payload the list of Authorization roles for the user: Read Only User, Administrator
5.  Istio Citadel<**发行者**> 发布所有工作负载的SPIFFE ID; Envoy代理<**消费者**> : 客户可以使用SPIFFE ID在Envoy代理之间建立mTLS连接。

## Security
1. [Istio & JWT: Step by Step Guide for Micro-Services Authentication](https://medium.com/intelligentmachines/istio-jwt-step-by-step-guide-for-micro-services-authentication-690b170348fc)
2. [Istio + OAuth 2.0](https://discuss.istio.io/t/istio-oauth-2-0/668)
3. [Configuring Istio with OIDC authentication](https://homelab.blog/blog/devops/Istio-OIDC-Config/)