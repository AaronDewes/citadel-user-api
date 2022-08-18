CREATE FUNCTION unique_backup_uploads_today() RETURNS setof text
  LANGUAGE plpgsql VOLATILE AS
$func$
BEGIN
   RETURN QUERY
   select distinct (key) from "Backups" where created_at > now() - interval '24 hours';
END
$func$;
