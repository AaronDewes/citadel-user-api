CREATE FUNCTION unique_backup_uploads(since timestamptz, "until" timestamptz) RETURNS setof text LANGUAGE plpgsql VOLATILE AS $func$
BEGIN
   RETURN QUERY
   select distinct (key) from "Backups" where (until > created_at and created_at > since);
END
$func$;

CREATE OR REPLACE FUNCTION unique_backup_uploads_today() RETURNS setof text LANGUAGE plpgsql VOLATILE AS $func$
BEGIN
   RETURN query select unique_backup_uploads(now() - interval '24 hours', now());
END
$func$;
