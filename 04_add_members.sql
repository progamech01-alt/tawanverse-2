-- 1. Create real accounts in Supabase Authentication > Users > Add user.
-- 2. Replace the email placeholders below with those accounts' emails.
-- 3. Run this SQL; it aborts if either email is missing. Passwords never belong in SQL.
begin;
do $$
declare admin_id uuid; viewer_id uuid;
begin
 select id into admin_id from auth.users where lower(email)=lower('REPLACE_WITH_ADMIN_EMAIL');
 select id into viewer_id from auth.users where lower(email)=lower('REPLACE_WITH_TAWAN_EMAIL');
 if admin_id is null or viewer_id is null then raise exception 'Create both Auth users and replace BOTH email placeholders before running'; end if;
 if admin_id=viewer_id then raise exception 'Use two different accounts'; end if;
 insert into public.tv_members(user_id,role) values(admin_id,'admin'),(viewer_id,'viewer') on conflict(user_id) do update set role=excluded.role;
end $$;
commit;
-- To allow Tawan to edit too, change her role to admin explicitly.
