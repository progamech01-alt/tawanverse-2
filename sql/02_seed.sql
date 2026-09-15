-- Canonical information supplied by the owner. Safe to rerun: never overwrites edits.
begin;
insert into public.tv_facts(title,key,value) values
('วันเริ่มคบ','relationship_start','2026-08-29'),
('วันบอกรักครั้งแรก','first_confession','2026-03-04'),
('วันเกิดภัทร์','phat_birthday','2005-03-14'),
('วันเกิดตะวัน','tawan_birthday','2005-10-29'),
('ชื่อภัทร์','phat_name','กรภัทร เนินพลับ'),
('ชื่อตะวัน','tawan_name','จิตลัดดา จำปาทอง') on conflict(key) do nothing;
insert into public.tv_events(id,title,description,start_at,type,status,recurrence) values
('10000000-0000-4000-8000-000000000001','วันที่บอกรักครั้งแรก','ข้อมูลวันที่จากเจ้าของเว็บไซต์','2026-03-04T00:00:00+07:00','relationship','completed','none'),
('10000000-0000-4000-8000-000000000002','วันแรกที่เราเป็นแฟนกัน','จุดเริ่มต้นของเรื่องราวบทใหม่','2026-08-29T00:00:00+07:00','relationship','completed','none'),
('10000000-0000-4000-8000-000000000003','วันเกิดตะวัน','','2026-10-29T00:00:00+07:00','birthday','confirmed','yearly'),
('10000000-0000-4000-8000-000000000004','วันเกิดภัทร์','','2026-03-14T00:00:00+07:00','birthday','confirmed','yearly'),
('10000000-0000-4000-8000-000000000005','วันครบรอบของเรา','','2027-08-29T00:00:00+07:00','relationship','confirmed','yearly') on conflict(id) do nothing;
insert into public.tv_knowledge(id,title,content,category,source,tags) values
('20000000-0000-4000-8000-000000000001','สีที่ตะวันชอบ','ตะวันชอบสีฟ้า','สิ่งที่ชอบ','ข้อมูลจากเจ้าของเว็บไซต์',array['สี','ฟ้า','ตะวัน']) on conflict(id) do nothing;
insert into public.tv_pages(title,slug,config)
select title,slug,jsonb_build_object('hero_title',heading,'subtitle',subtitle,'accent','#70DAFF','glow',0.6,'font_scale',1,'motion','gentle','alignment','left','layout','editorial','sections',jsonb_build_array('today','upcoming','memories','note'),'hidden','[]'::jsonb)
from (values
('Home','home',E'ทุกวันของเรา\nคือจักรวาลที่พิเศษ','เก็บทุกช่วงเวลาไว้ในแสงสีฟ้า แล้วค่อย ๆ เขียนเรื่องราวของเราไปด้วยกัน'),
('Journey','journey',E'ทุกช่วงเวลา\nพาเรามาถึงตรงนี้','จากวันแรก สู่วันนี้ และเรื่องราวที่ยังรออยู่ข้างหน้า'),
('Memories','memories',E'ความทรงจำ\nที่ยังส่องแสง','เก็บภาพ เสียง และความรู้สึกของวันนั้นไว้ด้วยกัน'),
('Time','time',E'เวลาเดินไป\nพร้อมกับเรา','วันสำคัญ แผนเล็ก ๆ และการนับถอยหลังครั้งต่อไป'),
('Letters','letters',E'บางความรู้สึก\nอยากเก็บไว้เป็นจดหมาย','ถึงคนที่ทำให้วันธรรมดา มีความหมายมากกว่าเดิม'),
('LUMI','lumi',E'มีอะไรอยากเล่า\nให้ LUMI ฟังไหม','ผู้ดูแลเรื่องราวเล็ก ๆ ในจักรวาลของเรา')
) as p(title,slug,heading,subtitle) on conflict(slug) do nothing;
commit;
