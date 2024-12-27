
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiassessMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[created_on] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_on] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted_on] [datetime] NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_diassess_master] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Unique_Diassess_Name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiassessPatientMap]    Script Date: 27/12/2024 17:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiassessPatientMap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[diassess_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[doctor_id] [int] NOT NULL,
	[details] [varchar](255) NOT NULL,
	[created_on] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_on] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted_on] [datetime] NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_DiassessPatientMap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorPatientMap]    Script Date: 27/12/2024 17:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorPatientMap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[created_on] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_on] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted_on] [datetime] NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_DoctorPatientMap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 27/12/2024 17:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[user_type] [varchar](50) NOT NULL,
	[phone_number] [varchar](20) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[date_of_birth] [date] NULL,
	[gender] [varchar](10) NOT NULL,
	[address] [varchar](255) NULL,
	[specialty] [varchar](100) NULL,
	[relative_contact_name] [varchar](100) NULL,
	[relative_contact_phone] [varchar](20) NULL,
	[password] [varchar](255) NOT NULL,
	[created_on] [datetime] NOT NULL,
	[modified_on] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted_on] [datetime] NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [pk_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_phone_number] UNIQUE NONCLUSTERED 
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DiassessMaster] ADD  CONSTRAINT [DF_DiassessMaster_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[DiassessPatientMap] ADD  CONSTRAINT [DF_DiassessPatientMap_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[DoctorPatientMap] ADD  CONSTRAINT [DF_DoctorPatientMap_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[DiassessMaster]  WITH CHECK ADD  CONSTRAINT [FK_DiassessMaster_UserMaster] FOREIGN KEY([created_by])
REFERENCES [dbo].[UserMaster] ([user_id])
GO
ALTER TABLE [dbo].[DiassessMaster] CHECK CONSTRAINT [FK_DiassessMaster_UserMaster]
GO
ALTER TABLE [dbo].[DiassessPatientMap]  WITH CHECK ADD  CONSTRAINT [FK_DiassessPatientMap_DiassessMaster] FOREIGN KEY([diassess_id])
REFERENCES [dbo].[DiassessMaster] ([id])
GO
ALTER TABLE [dbo].[DiassessPatientMap] CHECK CONSTRAINT [FK_DiassessPatientMap_DiassessMaster]
GO
ALTER TABLE [dbo].[DiassessPatientMap]  WITH CHECK ADD  CONSTRAINT [FK_DiassessPatientMap_UserMaster_CreatedBy] FOREIGN KEY([created_by])
REFERENCES [dbo].[UserMaster] ([user_id])
GO
ALTER TABLE [dbo].[DiassessPatientMap] CHECK CONSTRAINT [FK_DiassessPatientMap_UserMaster_CreatedBy]
GO
ALTER TABLE [dbo].[DiassessPatientMap]  WITH CHECK ADD  CONSTRAINT [FK_DiassessPatientMap_UserMaster_DoctorId] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[UserMaster] ([user_id])
GO
ALTER TABLE [dbo].[DiassessPatientMap] CHECK CONSTRAINT [FK_DiassessPatientMap_UserMaster_DoctorId]
GO
ALTER TABLE [dbo].[DiassessPatientMap]  WITH CHECK ADD  CONSTRAINT [FK_DiassessPatientMap_UserMaster_PatientID] FOREIGN KEY([patient_id])
REFERENCES [dbo].[UserMaster] ([user_id])
GO
ALTER TABLE [dbo].[DiassessPatientMap] CHECK CONSTRAINT [FK_DiassessPatientMap_UserMaster_PatientID]
GO
ALTER TABLE [dbo].[DoctorPatientMap]  WITH CHECK ADD  CONSTRAINT [FK_DoctorPatientMap_UserMaster] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[UserMaster] ([user_id])
GO
ALTER TABLE [dbo].[DoctorPatientMap] CHECK CONSTRAINT [FK_DoctorPatientMap_UserMaster]
GO
ALTER TABLE [dbo].[DoctorPatientMap]  WITH CHECK ADD  CONSTRAINT [FK_DoctorPatientMap_UserMaster1] FOREIGN KEY([patient_id])
REFERENCES [dbo].[UserMaster] ([user_id])
GO
ALTER TABLE [dbo].[DoctorPatientMap] CHECK CONSTRAINT [FK_DoctorPatientMap_UserMaster1]
GO
ALTER TABLE [dbo].[DoctorPatientMap]  WITH CHECK ADD  CONSTRAINT [FK_DoctorPatientMap_UserMaster2] FOREIGN KEY([created_by])
REFERENCES [dbo].[UserMaster] ([user_id])
GO
ALTER TABLE [dbo].[DoctorPatientMap] CHECK CONSTRAINT [FK_DoctorPatientMap_UserMaster2]
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [CK_gender] CHECK  (([gender]='Other' OR [gender]='Female' OR [gender]='Male'))
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [CK_gender]
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [CK_user_type] CHECK  (([user_type]='Admin' OR [user_type]='Patient' OR [user_type]='Doctor'))
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [CK_user_type]
GO

