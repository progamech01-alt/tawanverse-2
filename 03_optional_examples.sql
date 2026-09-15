-- OPTIONAL. Fictional examples only; not real memories. Can be deleted in Studio.
begin;
insert into public.tv_quick_notes(id,title,content) values('30000000-0000-4000-8000-000000000001','[ตัวอย่าง] โน้ตต้อนรับ','[ข้อความตัวอย่าง] บางวันไม่ต้องพิเศษ แค่ได้อยู่ข้างกันก็พอแล้ว') on conflict(id) do nothing;
insert into public.tv_letters(id,title,content,kind) values('30000000-0000-4000-8000-000000000002','[ตัวอย่าง] จดหมายฉบับแรก','นี่เป็นจดหมายตัวอย่าง แก้ไขเป็นข้อความของคุณได้จาก Studio → จดหมาย ข้อความนี้ไม่ใช่เหตุการณ์จริง','letter') on conflict(id) do nothing;
insert into public.tv_letters(id,title,content,kind,unlock_at) values('30000000-0000-4000-8000-000000000003','[ตัวอย่าง] แคปซูลทดสอบ','[ตัวอย่างเท่านั้น] แคปซูลเปิดแล้ว ระบบอนุญาตให้อ่านเมื่อถึงเวลา','capsule','2099-01-01T00:00:00+07:00') on conflict(id) do nothing;
insert into public.tv_wishlist(id,title,description,category) values('30000000-0000-4000-8000-000000000004','[ตัวอย่าง] ไปดูดาวด้วยกัน','ไอเดียสมมติสำหรับทดลองแปลง Wishlist เป็น Event','อยากเที่ยว') on conflict(id) do nothing;
commit;
