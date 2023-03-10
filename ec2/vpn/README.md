# VPN
This directory contains the resources for all VPNs

## Setup
AWS has the setup process documented [here](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/cvpn-getting-started.html)
When creating a new VPN, you needd to compelete the following steps:

Generate the certificates and keys using easy-rsa

```sh
$ git clone https://github.com/OpenVPN/easy-rsa.git
$ cd easy-rsa/easyrsa3
$ ./easyrsa init-pki
$ ./easyrsa build-ca nopass
$ ./easyrsa build-server-full server nopass
```

Import into ACM

```sh
$ aws --profile prod acm import-certificate \
  --certificate fileb://easyrsa3/pki/issued/server.crt \
  --private-key fileb://easyrsa3/pki/private/server.key \
  --certificate-chain fileb://easyrsa3/pki/ca.crt \
  --tags Key=Name,Value=VPNEndpoint
```
You can now deploy the cloudformation template, and use the created certificate

## Create client certificate
Clone the easy-rsa.git repo

```sh
git clone https://github.com/OpenVPN/easy-rsa.git
```

Then create a certificate
```sh
cd easy-rsa/easyrsa3
./easyrsa build-client-full <region>-<profile> nopass
```

Export the configuration file
```sh
aws --profile <profile> ec2 export-client-vpn-client-configuration --client-vpn-endpoint-id <cvpn-endpoint-id> --output text> <region>-<profile>.ovpn
```

Add certificate and private key to the config file by adding two new sections:
Contents of client certificate (.crt) file generated in step above
```
<cert>
-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----
</cert>
```

Contents of private key (.key) file generated in step above
```
<key>
-----BEGIN PRIVATE KEY-----
...
-----END PRIVATE KEY-----
</key>
```
Save this file somewhere secure (a password manager for example), and use with any OpenVpn client.

Then download any OpenVPN client. The AWS client can be downloaded from [here](https://aws.amazon.com/vpn/client-vpn-download/)

## Granting access to resources
The service needs to have a private IP in the 10.1.0.0/22 range. Then add the client vpn security group to the security group of the service that needs to be accessed

