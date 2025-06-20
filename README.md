# Advanced Ammo System

ระบบกระสุนขั้นสูงสำหรับ FiveM ที่รองรับทั้ง ESX และ QBCore Framework

## คุณสมบัติ

- รองรับหลายประเภทกระสุน
- ระบบจำกัดจำนวนกระสุนสูงสุด
- รองรับทั้ง ESX และ QBCore Framework
- ระบบ Cooldown ระหว่างการใช้งาน
- ระบบ Debug สำหรับการแก้ไขปัญหา
- ใช้ TaskReloadWeapon สำหรับแอนิเมชันการรีโหลดที่สมจริง

## ประเภทกระสุนที่รองรับ

1. **.357 Ammo**
   - รองรับ: WEAPON_REVOLVER, WEAPON_DOUBLEACTION, WEAPON_PISTOL50
   - เพิ่ม: 7 นัด
   - สูงสุด: 50 นัด

2. **.380 Ammo**
   - รองรับ: WEAPON_SNSPISTOL, WEAPON_MINISMG
   - เพิ่ม: 25 นัด
   - สูงสุด: 150 นัด

3. **5.45x39 Ammo**
   - รองรับ: WEAPON_COMPACTRIFLE, WEAPON_AKS74U, WEAPON_MB47, WEAPON_AK47, WEAPON_ASSAULTRIFLE
   - เพิ่ม: 20 นัด
   - สูงสุด: 200 นัด

4. **5.56x45 Ammo**
   - รองรับ: หลายประเภทปืน เช่น WEAPON_M249, WEAPON_COMBATMG, WEAPON_SCAR17FM
   - เพิ่ม: 20 นัด
   - สูงสุด: 200 นัด

5. **7.62x39 Ammo**
   - รองรับ: WEAPON_ALPHA47, WEAPON_AKM
   - เพิ่ม: 20 นัด
   - สูงสุด: 200 นัด

6. **7.62x54 Ammo**
   - รองรับ: WEAPON_MARKSMANRIFLE
   - เพิ่ม: 20 นัด
   - สูงสุด: 100 นัด

7. **7.62x52 Ammo**
   - รองรับ: WEAPON_GUSENBERG
   - เพิ่ม: 20 นัด
   - สูงสุด: 200 นัด

8. **9x19 Ammo**
   - รองรับ: หลายประเภทปืน เช่น WEAPON_GLOCK19, WEAPON_COMBATPISTOL
   - เพิ่ม: 30 นัด
   - สูงสุด: 200 นัด

9. **.45 ACP Ammo**
   - รองรับ: WEAPON_HEAVYPISTOL, WEAPON_MACHINEPISTOL, WEAPON_KVR
   - เพิ่ม: 30 นัด
   - สูงสุด: 200 นัด

10. **12 Gauge Ammo**
    - รองรับ: หลายประเภทปืน เช่น WEAPON_ASSAULTSHOTGUN, WEAPON_PUMPSHOTGUN
    - เพิ่ม: 10 นัด
    - สูงสุด: 100 นัด

11. **Oil Box**
    - รองรับ: WEAPON_PETROLCAN
    - เพิ่ม: 4000 หน่วย
    - สูงสุด: 10000 หน่วย

12. **PG-7V Rocket**
    - รองรับ: WEAPON_RPG
    - เพิ่ม: 1 ลูก
    - สูงสุด: 5 ลูก

13. **Water Grenade**
    - รองรับ: WEAPON_GRENADE
    - เพิ่ม: 1 ลูก
    - สูงสุด: 5 ลูก

## การติดตั้ง

1. ดาวน์โหลดไฟล์ทั้งหมด
2. วางโฟลเดอร์ใน `resources` ของเซิร์ฟเวอร์
3. เพิ่ม `ensure DooDev.Clip` ในไฟล์ `server.cfg`
4. รีสตาร์ทเซิร์ฟเวอร์

## การตั้งค่า

แก้ไขไฟล์ `config.weapon.lua` เพื่อปรับแต่งการตั้งค่าต่างๆ:

```lua
Config = {}

-- เปิด/ปิดโหมด Debug
Config.Debug = false

-- เวลา Cooldown ระหว่างการใช้งาน (มิลลิวินาที)
Config.UseCooldown = 1000

-- ตั้งค่าประเภทกระสุนต่างๆ
Config.AmmoTypes = {
    ["am.357"] = {
        label = ".357 Ammo",
        weapons = {
            "WEAPON_REVOLVER",
            "WEAPON_DOUBLEACTION",
            "WEAPON_PISTOL50"
        },
        addAmount = 7,
        maxStack = 50
    },
    -- เพิ่มประเภทกระสุนอื่นๆ ตามต้องการ
}
```

## การใช้งาน

1. เพิ่มไอเทมกระสุนในฐานข้อมูลของเซิร์ฟเวอร์
2. ใช้ไอเทมกระสุนจากคลังไอเทม
3. ระบบจะตรวจสอบความเข้ากันได้ของปืนและกระสุนโดยอัตโนมัติ
4. แสดงการแจ้งเตือนเมื่อใช้งานสำเร็จหรือเกิดข้อผิดพลาด

## การแก้ไขปัญหา

1. เปิดโหมด Debug ใน `config.weapon.lua`:
```lua
Config.Debug = true
```

2. ตรวจสอบ Console สำหรับข้อความ Debug
3. ตรวจสอบการตั้งค่าประเภทกระสุนและปืนที่รองรับ

## การสนับสนุน

หากพบปัญหา或有คำถาม สามารถติดต่อได้ที่:
- Discord: [DooDev Discord]
- GitHub: [DooDev GitHub]

## License

MIT License - ดูรายละเอียดเพิ่มเติมในไฟล์ LICENSE #
