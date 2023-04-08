BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    job_name        => 'osadnici_autoplay',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN kocka_procedura(); END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=SECONDLY;INTERVAL=5',
    enabled         => TRUE
  );
END;
