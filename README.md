# takepCosmac
COSMAC CDP1802 Single Board Computer  


<a href="https://sunrise-ev.com/photos/1802/1802me-manual.pdf" target=_blank> 1802 MemberChip Card </a> 互換  
<a href="https://hackaday.io/project/190289-1802-memberchip-card" target=_blank> 1802 MemberChip Card in Hackaday,io </a>


<img src=takepcosmac.png width=200 >
<img src=takepcosmac-r.png width=200 >



## Spec  
- S-RAM 512MBytes  
-- RAMメモリ空間は後半 32KBytes  
-- AS6C4008-55PCN (512KW×8bit)2チップ  
-- 出力ポートのアクセスで、後半512KをROM/RAM切り替え  

- ROM 64Bytes  
-- SST 27SF512(EEPROM)  
-- 27C512互換であれば使用可能、2764あたりからそのまま差し込めるはず  
-- メモリ空間の前半 32K は、ROM  


- SIO TTLレベル  
-- ソフトウェア実現  
-- 秋月で販売されている FTDI USBシリアル変換ケーブル(5V) が直接 差せる  
--  https://akizukidenshi.com/catalog/g/g105841/    

- Crystal EXO-3, 14.31818 MHz の8分周  
-- CPU は、約 1.7898 MHz で動作  
