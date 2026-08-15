# takepCosmac
COSMAC CDP1802 Single Board Computer,  1802 MemberChip Card互換

<a href="https://sunrise-ev.com/photos/1802/1802me2-manual.pdf" target=_blank> 1802 MemberChip Card </a> 互換  
<a href="https://hackaday.io/project/190289-1802-memberchip-card" target=_blank> 1802 MemberChip Card in Hackaday.io </a>  

<a href="https://cdn.hackaday.io/files/1902898141324576/MC21ANSA.bin"> MC21ANSA.bin </a> を、ROMの先頭(0番地)から書き込むと動作する  

<img src=takepcosmac.png width=200 >
<img src=takepcosmac-r.png width=200 >



## Spec  
- RAMは、メモリ空間の後半 32KBytes  
-- S-RAM,  AS6C4008-55PCN (512KW×8bit)1チップ使用  

- ROMは、メモリ空間の前半 32K  
-- EEPROM,  SST 27SF512(64KW×8bit)) 使用  
-- 27C512互換であれば使用可能、2764あたりからそのまま差し込めるはず  
-- ROMの通常アクセスは、前半 32KBytes (0〜0x7FFF)であるが…  
-- ROMの後半 32KBytes (0x8000〜0xFFFF)は、RAMとかぶっているが、IO readアクセスで読み出し可能  
--- ROMの後半を読み出して、RAMに転送することができる!  

- Crystal発振器 EPSON EXO-3, 14.31818 MHz の8分周  
-- CPU は、約 1.7898 MHz で動作  

- GAL16V8 使用  
-- <a href="takepCosmacGal/takepCosmac.pld"> 論理(ソース) </a>  
-- <a href="takepCosmacGal/takepCosmac.jed"> JDECファイル </a>  

- SIO TTLレベル  
-- ソフトウェア実現  
-- 秋月で販売されている FTDI USBシリアル変換ケーブル(5V) が直接 差せる  
--  https://akizukidenshi.com/catalog/g/g105841/    

## 1802 MemberChip Card の特殊なROMチップ・セレクトについて  
- <a href="https://sunrise-ev.com/photos/1802/1802me2-manual.pdf" target=_blank> 1802 MemberChip Card マニュアルPDF</a> の「Banked Memory」の章(P.21)に説明がある  
- <a href="https://hackaday.io/project/190289-1802-memberchip-card" target=_blank> 1802 MemberChip Card in Hackaday.io </a> にも解説がある  

<img src=https://cdn.hackaday.io/images/6775511696965099336.png width=320>  

- PROMの上位 32KBytes (0x8000〜0xFFFF) を読む方法  
  1.  読み出したいアドレスをレジスタにセットする。ただし、MSBは0にすること。例えば0x9000 を読みたいならば 0x1000 とする  
  2.  Xに、このレジスタの値をセットする。SEX命令などで  
  3.  「INP 0」(オペコード 0x68) 命令を実行する。通常、これは未定義命令である。  
     この命令は、入力ポート(N0-N2線)の指定無しで、読み込みをおこなう  
     CPU は、write サイクルを実行するが、PROMの後半から read し、CPU の Dレジスタに読み込む  
- MC21ANSA モニタの「E」コマンドは、PROMの後半から RAM へのブロック転送を行う  
  - 「E ソース番地 目的番地 バイト数」で、各パラメータは十六進数で指定  
       ソース番地:PROMアドレス、目的番地:RAMアドレス  


### 1802 MemberChip Card の特殊なROMチップ・セレクトの解説  
-- PROMの 下位 32KBを read するとき: A15=0 , /MRD=0 (通常).  
-- しかし、PROMの 下位 32KBに write するとき: A15=0, /MWR=0 , /MRD=1。  
--- /MWR=0 は PROM をチップ・セレクトし、CPUの A15=0 は PROM の read enable し、そして /MRD=1 は ROM address の A15ビットを Hi にする。  
    それにより、PROM の上位(0x8000-0xFFFF)を読み出す。  
--- しかし CPU データ・バスの出力と、PROM の出力がぶつかるのは困る。よって、CPUの INP 命令を使用する。(INP命令はデータ・バスに何も出さない)      
--- 以上により、CPU の Dレジスタに PROM のデータが入る


