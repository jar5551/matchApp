USE [Matching]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 2/7/2016 5:05:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[firstName] [varchar](255) NOT NULL,
	[lastName] [varchar](255) NOT NULL,
	[sex] int NOT NULL,
	[description] [text] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[modifiedDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [modifiedDate]
GO

ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [lastLoginDate]
GO


