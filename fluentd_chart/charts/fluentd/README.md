# Postfix

## Installing the Chart

`my-release` というリリース名でChartをインストールする場合は、以下のコマンドを実行します。

```bash
$ helm install --name my-release ./postfix
```

## Uninstalling the Chart

`my-release` をアンインストールする場合は以下のコマンドです。

```bash
$ helm delete my-release
```

## Configuration

以下の表に、Postfix chartのパラメータとデフォルト値を示します。

| パラメータ                             | 説明                                                 | デフォルト値                                                           |
|----------------------------------------|------------------------------------------------------|------------------------------------------------------------------------|
| `daemonset.config.smtpAuthPort`        | SMTPのサブミッションポート                           | `587`                                                                  |
| `daemonset.config.smtpAlternativePort` | SMTPの25番の代替となるポート番号                     | `2525`                                                                 |
| `image.repository`                     | Postfix imageのリポジトリ                            | `057575985710.dkr.ecr.ap-northeast-1.amazonaws.com/clusterops/postfix` |
| `image.tag`                            | Postfix imageのtag                                   | `latest`                                                               |
| `image.pullPolicy`                     | Image pull policy                                    | `IfNotPresent`                                                         |
| `fullnameOverride`                     | `postfix.fullname`を上書きします                     | `""`                                                                   |
| `nameOverride`                         | `postfix.name`を上書きします                         | `""`                                                                   |
| `postfix.header`                       | Postfixのheader_checksに使用するヘッダを上書きします | `Kubernetes`                                                           |
| `postfix.myNetworkCIDR`                | メールを送信するクライアントのCIDRを指定します       | `10.1.0.0/16`                                                          |
| `resources`                            | CPU/Memoryのrequests/limitsを指定します              | Memory: `128Mi`, CPU: `100m`                                           |
| `secretFiles.saslPasswd`               | `sasl_passwd`に相当する内容（Secretsとしてapply）    | `null`                                                                 |

### smtpAlternativePort

EKSのワーカノードですでにPostfixが動作しており、25番PortをListenしているため、K8s Podは `hostNetwork: true` の状態で25番Portを使用することができません。
そのため1024番以降のPortを `daemonset.config.smtpAlternativePort` に指定する必要があります（well-known portsを使用するには、 `privileges` を有効にする必要があります）。

### myNetworkCIDR

基本的にクラスタのVPC CIDRを指定することになります。Stagingは `10.1.0.0/16`, Productionは `10.0.0.0/16`です。
