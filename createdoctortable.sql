CREATE TABLE [dbo].[doctor] (
    [doctor_id]         INT          IDENTITY (1, 1) NOT NULL,
    [name]              VARCHAR (50) NULL,
    [emailid]           VARCHAR (50) NULL,
    [contact_no]        TEXT         NULL,
    [age]               NUMERIC (18) NULL,
    [gender]            CHAR (10)    NULL,
    [Address]           TEXT         NULL,
    [category]          TEXT         NULL,
    [registration_date] DATETIME     NULL,
    [updation_date]     DATETIME     NULL,
    [status]            BIT          NULL,
    [doctor_password]   TEXT         NULL,
    PRIMARY KEY CLUSTERED ([doctor_id] ASC)
);

