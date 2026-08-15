# takepCosmac
COSMAC CDP1802 Single Board Computer  


<a href="https://sunrise-ev.com/photos/1802/1802me-manual.pdf" target=_blank> 1802 MemberChip Card </a> 互換  
<a href="https://hackaday.io/project/190289-1802-memberchip-card" target=_blank> 1802 MemberChip Card in Hackaday,io </a>


<img src=takepcosmac.png width=200 >
<img src=takepcosmac-r.png width=200 >



## Spec  
- RAMは、メモリ空間の後半 32KBytes  
-- S-RAM,  AS6C4008-55PCN (512KW×8bit)1チップ使用  

- ROMは、メモリ空間の前半 32K  
-- EEPROM,  SST 27SF512(64KW×8bit)) 使用  
-- 27C512互換であれば使用可能、2764あたりからそのまま差し込めるはず  

- SIO TTLレベル  
-- ソフトウェア実現  
-- 秋月で販売されている FTDI USBシリアル変換ケーブル(5V) が直接 差せる  
--  https://akizukidenshi.com/catalog/g/g105841/    

- Crystal発振器 EXO-3, 14.31818 MHz の8分周  
-- CPU は、約 1.7898 MHz で動作  
