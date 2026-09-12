eSET session "vars.termo" = '%audiência%';

SELECT * FROM register."flowSteps"
WHERE "submitFormProps"::text LIKE current_setting('vars.termo');

SELECT * FROM register."flowSteps"
WHERE "fetchDetailsProps"::text LIKE current_setting('vars.termo');

SELECT * FROM register."typesProgress"
WHERE "flowRequestProps"::text LIKE current_setting('vars.termo');

SELECT * FROM register."flowSteps"
WHERE "formType"::text LIKE current_setting('vars.termo');

SELECT * FROM register."flowSteps"
WHERE "title"::text LIKE current_setting('vars.termo');