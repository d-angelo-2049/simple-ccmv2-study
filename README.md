# simple-ccmv2-study

## イントロ

このリポジトリは Cassandra Cluster Manager の演習のために必要な依存関係を含んだ仮想環境を提供するものです。<br>
この仮想環境で準備しているソフトウェアは以下になります。

- Java8 ("1.8.0_181")
- python2
- pip
- YCSB
- CCM (Cassandra Cluster Manager)

※ CCM v2.0.11 でのみ動作確認しております。 <br>
それ以外の version の場合意図した動作にならない可能性があります。

## 前提条件

下記を install していること

- docker
- docker compose

※ docker だけでも image さえ作れば動くと思います。

## 環境構築手順

1. 本リポジトリを clone する

```
$ git clone git@github.com:d-angelo-2049/simple-ccm-study.git
```

2. [このリンク](https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html) から jdk-8u181-linux-x64.tar.gz をダウンロードしてプロジェクトディレクトリに配置する

3. コンテナを立ち上げる（初回は image のビルドから）

```
$ docker compose up --build -d
```

4. 作成した コンテナ ID を調べる

```
$ docker ps
<!-- 例示：下記みたいな感じで出力する -->
CONTAINER ID   IMAGE                   COMMAND               CREATED          STATUS          PORTS     NAMES
89cec9d8c1ae   simple-ccm-study-ycsb   "tail -f /dev/null"   39 minutes ago   Up 38 minutes             simple-ccm-study-ycsb-1
```

5. コンテナにログインする

```
$ docker exec -it 89cec9d8c1ae /bin/bash
<!--あとは自由に演習 -->
root@89cec9d8c1ae:/YCSB#
```
