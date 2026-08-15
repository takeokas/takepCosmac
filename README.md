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
- <a href="https://sunrise-ev.com/photos/1802/1802me2-manual.pdf" target=_blank> 1802 MemberChip Card マニュアルPDF</a> の「Banked Memory」の章(P.21)に,データシートにない、メチャクチャな仕様に基づいて動かす(未定義命令も使用)と書いてあって…  
- <a href="https://hackaday.io/project/190289-1802-memberchip-card" target=_blank> 1802 MemberChip Card in Hackaday,io </a> にも解説がある  
<img src=https://cdn.hackaday.io/images/6775511696965099336.png width=320>

