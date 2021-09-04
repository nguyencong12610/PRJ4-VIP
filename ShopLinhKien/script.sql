CREATE DATABASE [ShopLinhKien]
GO
USE [ShopLinhKien]
GO
/****** Object:  Table [dbo].[category]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[parentid] [int] NOT NULL,
	[orders] [int] NOT NULL,
	[metakey] [nvarchar](150) NULL,
	[metadesc] [nvarchar](150) NULL,
	[created_at] [smalldatetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [smalldatetime] NULL,
	[updated_by] [int] NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contact]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](15) NULL,
	[title] [nvarchar](255) NULL,
	[detail] [ntext] NULL,
	[created_at] [smalldatetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [smalldatetime] NULL,
	[updated_by] [int] NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[leaseCategory]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leaseCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[created_at] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[leaseItem]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leaseItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CateId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Deposits] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Content] [ntext] NOT NULL,
	[Status] [int] NOT NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [PK_leaseItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaseOrder]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaseOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LeaseItemID] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[StatusPayment] [int] NULL,
	[SoftWare] [varchar](50) NULL,
	[IsCancel] [int] NULL,
	[Deposits] [float] NULL,
	[PaymentMethod] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Comfirm] [int] NULL,
	[Emal] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[isTransport] [int] NULL,
	[TotalReturn] [int] NULL,
	[TotalPrice] [float] NOT NULL,
	[RentalPeriod] [int] NOT NULL,
	[ComfirmReturn] [int] NULL,
	[ReturnDate] [smalldatetime] NOT NULL,
	[DayStart] [smalldatetime] NULL,
	[PayableDate] [smalldatetime] NULL,
	[created_at] [smalldatetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_LeaseOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LeaseSoftware]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaseSoftware](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CatId] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_LeaseSoftware] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[link]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[slug] [varchar](max) NULL,
	[tableId] [int] NULL,
	[type] [varchar](200) NULL,
	[parentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[menu]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[type] [varchar](255) NOT NULL,
	[link] [varchar](255) NULL,
	[tableid] [int] NULL,
	[parentid] [int] NOT NULL,
	[orders] [int] NOT NULL,
	[position] [varchar](255) NOT NULL,
	[created_at] [smalldatetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_at] [smalldatetime] NOT NULL,
	[updated_by] [int] NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[userid] [int] NOT NULL,
	[created_ate] [smalldatetime] NOT NULL,
	[exportdate] [smalldatetime] NULL,
	[deliveryaddress] [nvarchar](255) NOT NULL,
	[deliveryname] [nvarchar](100) NOT NULL,
	[deliveryphone] [varchar](255) NOT NULL,
	[deliveryemail] [varchar](255) NOT NULL,
	[deliveryPaymentMethod] [nvarchar](255) NOT NULL,
	[StatusPayment] [int] NOT NULL,
	[updated_at] [smalldatetime] NOT NULL,
	[updated_by] [int] NULL,
	[status] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ordersdetail]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordersdetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[priceSale] [int] NOT NULL,
	[amount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[post]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[topid] [int] NULL,
	[title] [nvarchar](max) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[detail] [ntext] NULL,
	[img] [varchar](255) NULL,
	[type] [varchar](50) NULL,
	[metakey] [nvarchar](150) NOT NULL,
	[metadesc] [nvarchar](150) NOT NULL,
	[created_at] [smalldatetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [smalldatetime] NOT NULL,
	[updated_by] [int] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[catid] [int] NOT NULL,
	[Submenu] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[slug] [nvarchar](255) NOT NULL,
	[img] [varchar](100) NOT NULL,
	[detail] [ntext] NOT NULL,
	[number] [int] NOT NULL,
	[price] [float] NOT NULL,
	[pricesale] [float] NOT NULL,
	[metakey] [nvarchar](150) NULL,
	[metadesc] [nvarchar](max) NULL,
	[created_at] [smalldatetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [smalldatetime] NOT NULL,
	[updated_by] [int] NOT NULL,
	[status] [int] NOT NULL,
	[sold] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[accessName] [varchar](255) NOT NULL,
	[description] [nvarchar](225) NULL,
	[GropID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[slider]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[slider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[url] [varchar](255) NOT NULL,
	[position] [varchar](100) NOT NULL,
	[img] [varchar](100) NOT NULL,
	[orders] [int] NULL,
	[created_at] [smalldatetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_at] [smalldatetime] NOT NULL,
	[updated_by] [int] NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[topic]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[topic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[parentid] [int] NOT NULL,
	[orders] [int] NOT NULL,
	[metakey] [varchar](150) NULL,
	[metadesc] [nvarchar](max) NULL,
	[created_at] [smalldatetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [smalldatetime] NOT NULL,
	[updated_by] [int] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 8/29/2021 12:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[username] [varchar](225) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[gender] [nvarchar](5) NULL,
	[phone] [varchar](20) NULL,
	[img] [varchar](100) NULL,
	[access] [int] NOT NULL,
	[created_at] [smalldatetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [smalldatetime] NOT NULL,
	[updated_by] [int] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (23, N'CPU - BỘ VI XỬ LÝ', N'cpu---bo-vi-xu-ly', 0, 0, N'CPU - BỘ VI XỬ LÝ', N'CPU - BỘ VI XỬ LÝ', CAST(0xAC7C036B AS SmallDateTime), 1, CAST(0xAD0D0398 AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (24, N'RAM - BỘ NHỚ TRONG', N'ram---bo-nho-trong', 0, 0, N'RAM - BỘ NHỚ TRONG', N'RAM - BỘ NHỚ TRONG', CAST(0xAC7C0376 AS SmallDateTime), 1, CAST(0xAD0D0398 AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (25, N'VGA - CARD MÀN HÌNH', N'vga---card-man-hinh', 0, 0, N'VGA - CARD MÀN HÌNH', N'VGA - CARD MÀN HÌNH', CAST(0xAC7C037A AS SmallDateTime), 1, CAST(0xAD0D0398 AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (26, N'Ổ CỨNG SSD', N'o-cung-ssd', 0, 0, N'Ổ CỨNG SSD', N'Ổ CỨNG SSD', CAST(0xAC7C0405 AS SmallDateTime), 1, CAST(0xAD0D0399 AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (27, N'Ổ cứng SSD Plextor PX 256M8VC 256GB 2.5 inch SATA3', N'o-cung-ssd-plextor-px-256m8vc-256gb-2.5-inch-sata3', 0, 0, N'Ổ cứng SSD Plextor PX 256M8VC 256GB 2.5 inch SATA3', N'Ổ cứng SSD Plextor PX 256M8VC 256GB 2.5 inch SATA3', CAST(0xAC7C0405 AS SmallDateTime), 1, CAST(0xAC7C0405 AS SmallDateTime), 1, 0)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (28, N'Ổ CỨNG HDD', N'o-cung-hdd', 0, 0, N'Ổ CỨNG HDD', N'Ổ CỨNG HDD', CAST(0xAC7C0406 AS SmallDateTime), 1, CAST(0xAD0D0399 AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (29, N'CASE - VỎ MÁY TÍNH', N'case---vo-may-tinh', 0, 0, N'CASE - VỎ MÁY TÍNH', N'CASE - VỎ MÁY TÍNH', CAST(0xAC7C0407 AS SmallDateTime), 1, CAST(0xAD0D039A AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (2, N'nguyen van hung', N'vanhung3339@gmail.com', N'0975271384', N'Làm thế nào để có nó?', N'Có rất nhiều biến thể của Lorem Ipsum mà bạn có thể tìm thấy, nhưng đa số được biến đổi bằng cách thêm các yếu tố hài hước, các từ ngẫu nhiên có khi không có vẻ gì là có ý nghĩa. Nếu bạn định sử dụng một đoạn Lorem Ipsum, bạn nên kiểm tra kĩ để chắn chắn là không có gì nhạy cảm được giấu ở giữa đoạn văn bản. Tất cả các công cụ sản xuất văn bản mẫu Lorem Ipsum đều được làm theo cách lặp đi lặp lại các đoạn chữ cho tới đủ thì thôi, khiến cho lipsum.com trở thành công cụ sản xuất Lorem Ipsum đáng giá nhất trên mạng. Trang web này sử dụng hơn 200 từ la-tinh, kết hợp thuần thục nhiều cấu trúc câu để tạo ra văn bản Lorem Ipsum trông có vẻ thật sự hợp lí. Nhờ thế, văn bản Lorem Ipsum được tạo ra mà không cần một sự lặp lại nào, cũng không cần chèn thêm các từ ngữ hóm hỉnh hay thiếu trật tự.', CAST(0xAB1102C0 AS SmallDateTime), NULL, CAST(0xAB1102DF AS SmallDateTime), 1, 1)
INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (5, N'ád', N'ád', N'12312312', N'tôi muôn mua @@2', N'nhưng tui k có tiền', CAST(0xAB110000 AS SmallDateTime), 1, CAST(0xAB110000 AS SmallDateTime), 1, 1)
INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (6, N'nguyen van hhhh', N'anh4docganh@gmail.com', N'09747328372', N'0650320203205', N'fSSSSSSSSSSSSSSSSSSSSSSSSSS', CAST(0xAB9A0247 AS SmallDateTime), NULL, CAST(0xABF40428 AS SmallDateTime), 1, 2)
INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (7, N'nguyen van hhhh', N'vanhung3339@gmail.com', N'09747328372', N'0650320203205', N'dddddddddddddddddddddddddddddddd', CAST(0xABAC0583 AS SmallDateTime), NULL, CAST(0xABB40213 AS SmallDateTime), 1, 2)
INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (8, N'nguyen van hhhh', N'vanhung3339@gmail.com', N'09747328372', N'0650320203205', N'?dasdasdadddddddddddddddddddddddddddddddddddddddddddd', CAST(0xABAC0586 AS SmallDateTime), NULL, CAST(0xABB40213 AS SmallDateTime), 1, 2)
INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (9, N'Nguyễn Văn Hưng', N'vanhungdev@gmail.com', N'0975271384', N'Hướng dẫn cách làm nem chua Thanh Hóa công thức chuẩn', N'ádasda', CAST(0xAD7E04F5 AS SmallDateTime), NULL, CAST(0xAD7E04F5 AS SmallDateTime), 1, 2)
SET IDENTITY_INSERT [dbo].[contact] OFF
SET IDENTITY_INSERT [dbo].[leaseCategory] ON 

INSERT [dbo].[leaseCategory] ([ID], [Name], [Status], [created_at]) VALUES (1, N'Cho thuê máy bàn', 1, CAST(0x0000ADBD00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[leaseCategory] OFF
SET IDENTITY_INSERT [dbo].[leaseItem] ON 

INSERT [dbo].[leaseItem] ([ID], [Name], [CateId], [Price], [Deposits], [Description], [Content], [Status], [Order]) VALUES (1, N'PC - CẤU HÌNH 1', 1, 199000, 500000, N'CẤU HÌNH CƠ BẢN ,VĂN PHÒNG', N'<div class="elementor-element elementor-element-d9f1d31 box-center elementor-position-top elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="d9f1d31" data-element_type="widget" data-widget_type="image-box.default" style="position: relative; width: 252.656px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: Helvetica, sans-serif;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-image-box-wrapper" style="text-align: center; -webkit-box-align: start; align-items: flex-start;"><div class="elementor-image-box-content" style="width: 252.656px;"><p class="elementor-image-box-description" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var( --e-global-typography-text-font-family ); font-size: 15px; line-height: 1.6em;">Đáp ứng cho những nhu cầu cơ bản như lướt web, ứng dụng văn phòng</p></div></div></div></div><div class="elementor-element elementor-element-22ab599 elementor-widget elementor-widget-text-editor" data-id="22ab599" data-element_type="widget" data-widget_type="text-editor.default" style="position: relative; color: rgb(0, 0, 0); font-family: var( --e-global-typography-text-font-family ); width: 252.656px; margin-bottom: 20px; line-height: 1.3em;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-text-editor elementor-clearfix" style="column-gap: 0px;"><ul style="margin-bottom: 10px;"><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">CPU: Intel Core I5 – 3470S</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Ram 8G – Ổ cứng SSD 120G</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Màn hình (LCD) : 18.5 Inch&nbsp;</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">VGA : Intel HD Graphics</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">HĐH ( OS) &nbsp;: Windows 10 Bản Quyền</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Phụ kiện kèm : Keyboard + Mouse&nbsp;</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê ngày :&nbsp; &nbsp;<span style="font-weight: 700;"><span style="color: rgb(15, 155, 230);">199.000đ /Ngày</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tuần:&nbsp; &nbsp; &nbsp;<span style="color: rgb(15, 155, 230);"><span style="font-weight: 700;">500.000đ /Tuần</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tháng&nbsp;:&nbsp;&nbsp;<span style="color: rgb(15, 155, 230);"><span style="font-weight: 700;">1.000.000đ /Tháng</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá chưa bao gồm VAT</span></p></li></ul></div></div></div><div class="elementor-element elementor-element-e63b4ac btn-section btn-section__big elementor-align-center elementor-widget elementor-widget-button" data-id="e63b4ac" data-element_type="widget" data-widget_type="button.default" style="text-align: center; position: relative; width: 252.656px; color: rgb(51, 51, 51); font-family: Helvetica, sans-serif;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-button-wrapper"><a href="https://ictsaigon.vn/cho-thue-may-tinh-de-ban-hcm/#" class="elementor-button-link elementor-button elementor-size-sm" role="button" style="outline: 0px; cursor: pointer; display: inline-block; line-height: 30px; fill: rgb(255, 255, 255); transition: all 0.3s ease 0s; height: 30px; font-weight: var( --e-global-typography-accent-font-weight ); box-shadow: none; width: auto; font-family: var( --e-global-typography-accent-font-family ); color: rgb(255, 255, 255) !important; font-size: 14px !important; padding: 0px 25px !important; border-radius: 50px !important; border-color: rgb(47, 149, 210) !important;"><span class="elementor-button-content-wrapper" style="display: flex; -webkit-box-pack: center; justify-content: center; text-decoration: inherit;"></span></a></div></div></div>', 1, 0)
INSERT [dbo].[leaseItem] ([ID], [Name], [CateId], [Price], [Deposits], [Description], [Content], [Status], [Order]) VALUES (2, N'PC - CẤU HÌNH 2', 1, 250000, 500000, N'CẤU HÌNH GAME , ĐỒ HỌA 2D CƠ BẢN', N'<div class="elementor-element elementor-element-9eed6af box-center elementor-position-top elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="9eed6af" data-element_type="widget" data-widget_type="image-box.default" style="position: relative; width: 293.656px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: Helvetica, sans-serif;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-image-box-wrapper" style="text-align: center; -webkit-box-align: start; align-items: flex-start;"><div class="elementor-image-box-content" style="width: 293.656px;"><p class="elementor-image-box-description" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var( --e-global-typography-text-font-family ); font-size: 15px; line-height: 1.6em;"><span style="color: rgb(63, 63, 63); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">Với vi xử lý mạnh mẽ, dung lượng RAM lớn cùng ổ cứng SSD truy xuất cực nhanh</span></p></div></div></div></div><div class="elementor-element elementor-element-76a1a57 elementor-widget elementor-widget-text-editor" data-id="76a1a57" data-element_type="widget" data-widget_type="text-editor.default" style="position: relative; color: rgb(0, 0, 0); font-family: var( --e-global-typography-text-font-family ); width: 293.656px; margin-bottom: 20px; line-height: 1.3em;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-text-editor elementor-clearfix"><ul style="margin-bottom: 10px;"><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">CPU: Intel Core I5 – 3470S</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Ram 8G – Ổ cứng SSD 120G</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Màn hình (LCD) : 18.5 Inch&nbsp;</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">VGA : GTX 2G</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">HĐH ( OS) &nbsp;: Windows 10 Bản Quyền</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Phụ kiện kèm : Keyboard + Mouse&nbsp;</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê ngày :&nbsp; &nbsp;<span style="font-weight: 700;"><span style="color: rgb(15, 155, 230);">250.000đ /Ngày</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tuần:&nbsp; &nbsp; &nbsp;<span style="color: rgb(15, 155, 230);"><span style="font-weight: 700;">700.000đ /Tuần</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tháng&nbsp;:&nbsp;<span style="color: rgb(15, 155, 230);">&nbsp;<span style="font-weight: 700;">1.500.000đ /Tháng</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá chưa bao gồm VAT</span></p></li></ul></div></div></div>', 1, 0)
INSERT [dbo].[leaseItem] ([ID], [Name], [CateId], [Price], [Deposits], [Description], [Content], [Status], [Order]) VALUES (3, N'PC - CẤU HÌNH 3', 1, 1200000, 500000, N'CẤU HÌNH GAME ĐỒ HỌA, TẦM TRUNG', N'<div class="elementor-element elementor-element-e98a9e2 box-center elementor-position-top elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="e98a9e2" data-element_type="widget" data-widget_type="image-box.default" style="position: relative; width: 293.656px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: Helvetica, sans-serif;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-image-box-wrapper" style="text-align: center; -webkit-box-align: start; align-items: flex-start;"><div class="elementor-image-box-content" style="width: 293.656px;"><p class="elementor-image-box-description" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var( --e-global-typography-text-font-family ); font-size: 15px; line-height: 1.6em;">Chuyên dành cho thiết kế đồ họa, các dòng game nặng yêu cầu cấu hình cao nhất hiện nay.</p></div></div></div></div><div class="elementor-element elementor-element-b451d17 elementor-widget elementor-widget-text-editor" data-id="b451d17" data-element_type="widget" data-widget_type="text-editor.default" style="position: relative; color: rgb(0, 0, 0); font-family: var( --e-global-typography-text-font-family ); width: 293.656px; margin-bottom: 20px; line-height: 1.3em;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-text-editor elementor-clearfix"><ul style="margin-bottom: 10px;"><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">CPU: Intel Core I7 – 9700F</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Ram 16G – Ổ cứng SSD 240GB</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Màn hình (LCD) : 23 Inch Full HD&nbsp;</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">VGA : VGA GTX 2070 8GB</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">HĐH ( OS) &nbsp;: Windows 10 Bản Quyền</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Phụ kiện kèm : Keyboard + Mouse&nbsp;</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê ngày :&nbsp; &nbsp;<span style="font-weight: 700;"><span style="color: rgb(15, 155, 230);">1.200.000đ /Ngày</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tuần:&nbsp; &nbsp; &nbsp;<span style="font-weight: 700;"><span style="color: rgb(15, 155, 230);">3.500.000đ /Tuần</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tháng&nbsp;:&nbsp;<span style="font-weight: 700;"><span style="color: rgb(15, 155, 230);">&nbsp;6.500.000đ /Tháng</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá chưa bao gồm VAT</span></p></li></ul></div></div></div>', 1, 0)
INSERT [dbo].[leaseItem] ([ID], [Name], [CateId], [Price], [Deposits], [Description], [Content], [Status], [Order]) VALUES (4, N'PC - CẤU HÌNH 4', 1, 1115000, 500000, N'PC - CẤU HÌNH 4', N'<div class="elementor-element elementor-element-57abfd5 box-center elementor-position-top elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="57abfd5" data-element_type="widget" data-widget_type="image-box.default" style="position: relative; width: 293.656px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: Helvetica, sans-serif;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-image-box-wrapper" style="text-align: center; -webkit-box-align: start; align-items: flex-start;"><div class="elementor-image-box-content" style="width: 293.656px;"><p class="elementor-image-box-description" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var( --e-global-typography-text-font-family ); font-size: 15px; line-height: 1.6em;">Đáp ứng cho những nhu cầu cơ bản như lướt web, ứng dụng văn phòng, đồ họa</p></div></div></div></div><div class="elementor-element elementor-element-15c50c1 elementor-widget elementor-widget-text-editor" data-id="15c50c1" data-element_type="widget" data-widget_type="text-editor.default" style="position: relative; color: rgb(0, 0, 0); font-family: var( --e-global-typography-text-font-family ); width: 293.656px; margin-bottom: 20px; line-height: 1.3em;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-text-editor elementor-clearfix"><ul style="margin-bottom: 10px;"><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">CPU: Intel Core I5,i7&nbsp; – Gen 10</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Ram 8G – Ổ cứng SSD 120G</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Màn hình (LCD) : 21.5 Inch&nbsp;</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">VGA : Intel HD Graphic</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">HĐH ( OS) &nbsp;: Windows 10 Bản Quyền</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Phụ kiện kèm : Keyboard + Mouse&nbsp;</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê ngày :&nbsp; &nbsp;<span style="color: rgb(15, 155, 230);"><span style="font-weight: 700;">115000</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tuần:&nbsp; &nbsp; &nbsp;<span style="color: rgb(15, 155, 230);"><span style="font-weight: 700;">805.000</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tháng&nbsp;:&nbsp;<span style="color: rgb(15, 155, 230);">&nbsp;<span style="font-weight: 700;">3.450.000</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá chưa bao gồm VAT</span></p></li></ul></div></div></div><div class="elementor-element elementor-element-40c8b20 btn-section btn-section__big elementor-align-center elementor-widget elementor-widget-button" data-id="40c8b20" data-element_type="widget" data-widget_type="button.default" style="text-align: center; position: relative; width: 293.656px; color: rgb(51, 51, 51); font-family: Helvetica, sans-serif;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-button-wrapper"><a href="https://ictsaigon.vn/cho-thue-may-tinh-de-ban-hcm/#" class="elementor-button-link elementor-button elementor-size-sm" role="button" style="outline: 0px; cursor: pointer; display: inline-block; line-height: 30px; fill: rgb(255, 255, 255); transition: all 0.3s ease 0s; height: 30px; font-weight: var( --e-global-typography-accent-font-weight ); box-shadow: none; width: auto; font-family: var( --e-global-typography-accent-font-family ); color: rgb(255, 255, 255) !important; font-size: 14px !important; padding: 0px 25px !important; border-radius: 50px !important; border-color: rgb(47, 149, 210) !important;"><span class="elementor-button-content-wrapper" style="display: flex; -webkit-box-pack: center; justify-content: center; text-decoration: inherit;"></span></a></div></div></div>', 1, 0)
INSERT [dbo].[leaseItem] ([ID], [Name], [CateId], [Price], [Deposits], [Description], [Content], [Status], [Order]) VALUES (5, N'PC - CẤU HÌNH 5', 1, 1500000, 500000, N'CẤU HÌNH GAME KHỦNG, ĐỒ HỌA NẶNG', N'<div class="elementor-element elementor-element-4d5a246 box-center elementor-position-top elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="4d5a246" data-element_type="widget" data-widget_type="image-box.default" style="position: relative; width: 293.656px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: Helvetica, sans-serif;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-image-box-wrapper" style="text-align: center; -webkit-box-align: start; align-items: flex-start;"><div class="elementor-image-box-content" style="width: 293.656px;"><p class="elementor-image-box-description" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var( --e-global-typography-text-font-family ); font-size: 15px; line-height: 1.6em;"><span style="color: rgb(63, 63, 63); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">Với vi xử lý mạnh mẽ, dung lượng RAM lớn cùng ổ cứng SSD truy xuất cực nhanh</span></p></div></div></div></div><div class="elementor-element elementor-element-3675428 elementor-widget elementor-widget-text-editor" data-id="3675428" data-element_type="widget" data-widget_type="text-editor.default" style="position: relative; color: rgb(0, 0, 0); font-family: var( --e-global-typography-text-font-family ); width: 293.656px; margin-bottom: 20px; line-height: 1.3em;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-text-editor elementor-clearfix"><ul style="margin-bottom: 10px;"><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">CPU: Intel Core I7 – 10700F</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Ram 16G – Ổ cứng SSD 240G</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Màn hình (LCD) : 24 Inch Full HD 144Hz</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">VGA : VGA GTX 2070 8GB</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">HĐH ( OS) &nbsp;: Windows 10 Bản Quyền</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Phụ kiện kèm : Keyboard + Mouse&nbsp;</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê ngày :&nbsp; &nbsp;<span style="color: rgb(15, 155, 230);"><span style="font-weight: 700;">1.500.000đ /Ngày</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tuần:&nbsp; &nbsp; &nbsp;<span style="font-weight: 700;"><span style="color: rgb(15, 155, 230);">4.000.000đ /Tuần</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tháng&nbsp;:&nbsp;<span style="font-weight: 700;"><span style="color: rgb(15, 155, 230);">&nbsp;7.500.000đ /Tháng</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá chưa bao gồm VAT</span></p></li></ul></div></div></div>', 1, 0)
INSERT [dbo].[leaseItem] ([ID], [Name], [CateId], [Price], [Deposits], [Description], [Content], [Status], [Order]) VALUES (6, N'PC - CẤU HÌNH 6', 1, 1000000, 500000, N'CẤU HÌNH RENDER, DỰNG PHIM VIDEO', N'<div class="elementor-element elementor-element-e19458e box-center elementor-position-top elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="e19458e" data-element_type="widget" data-widget_type="image-box.default" style="position: relative; width: 293.656px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: Helvetica, sans-serif;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-image-box-wrapper" style="text-align: center; -webkit-box-align: start; align-items: flex-start;"><div class="elementor-image-box-content" style="width: 293.656px;"><p class="elementor-image-box-description" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var( --e-global-typography-text-font-family ); font-size: 15px; line-height: 1.6em;">Chuyên dành cho thiết kế đồ họa, các dòng game nặng yêu cầu cấu hình cao nhất hiện nay.</p></div></div></div></div><div class="elementor-element elementor-element-11ba7a9 elementor-widget elementor-widget-text-editor" data-id="11ba7a9" data-element_type="widget" data-widget_type="text-editor.default" style="position: relative; color: rgb(0, 0, 0); font-family: var( --e-global-typography-text-font-family ); width: 293.656px; margin-bottom: 20px; line-height: 1.3em;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-text-editor elementor-clearfix"><ul style="margin-bottom: 10px;"><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">CPU: 2 x Xeon E5 2678 v3, 24core/48threads</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Ram 64G – Ổ cứng SSD 500G</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Màn hình (LCD) : 24 Inch</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">VGA : GTX 1080TI 11GB</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">HĐH ( OS) &nbsp;: Windows 10 Bản Quyền</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Phụ kiện kèm : Keyboard + Mouse&nbsp;</span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê ngày :&nbsp; &nbsp;<span style="font-weight: 700;"><span style="color: rgb(15, 155, 230);">1.000.000đ /Ngày</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tuần:&nbsp; &nbsp; &nbsp;<span style="font-weight: 700;"><span style="color: rgb(15, 155, 230);">3.500.000đ /Tuần</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá thuê tháng&nbsp;:&nbsp;<span style="font-weight: 700;"><span style="color: rgb(15, 155, 230);">&nbsp;6.500.000đ /Tháng</span></span></span></p></li><li><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px;"><span style="font-family: helvetica, arial, sans-serif;">Giá chưa bao gồm VAT</span></p></li></ul></div></div></div><div class="elementor-element elementor-element-1ac80bd btn-section btn-section__big elementor-align-center elementor-widget elementor-widget-button" data-id="1ac80bd" data-element_type="widget" data-widget_type="button.default" style="text-align: center; position: relative; width: 293.656px; color: rgb(51, 51, 51); font-family: Helvetica, sans-serif;"><div class="elementor-widget-container" style="transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-border-radius 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;"><div class="elementor-button-wrapper"><a href="https://ictsaigon.vn/cho-thue-may-tinh-de-ban-hcm/#" class="elementor-button-link elementor-button elementor-size-sm" role="button" style="outline: 0px; cursor: pointer; display: inline-block; line-height: 30px; fill: rgb(255, 255, 255); transition: all 0.3s ease 0s; height: 30px; font-weight: var( --e-global-typography-accent-font-weight ); box-shadow: none; width: auto; font-family: var( --e-global-typography-accent-font-family ); color: rgb(255, 255, 255) !important; font-size: 14px !important; padding: 0px 25px !important; border-radius: 50px !important; border-color: rgb(47, 149, 210) !important;"><span class="elementor-button-content-wrapper" style="display: flex; -webkit-box-pack: center; justify-content: center; text-decoration: inherit;"></span></a></div></div></div>', 1, 0)
SET IDENTITY_INSERT [dbo].[leaseItem] OFF
SET IDENTITY_INSERT [dbo].[LeaseOrder] ON 

INSERT [dbo].[LeaseOrder] ([ID], [LeaseItemID], [UserId], [StatusPayment], [SoftWare], [IsCancel], [Deposits], [PaymentMethod], [Name], [Comfirm], [Emal], [Phone], [isTransport], [TotalReturn], [TotalPrice], [RentalPeriod], [ComfirmReturn], [ReturnDate], [DayStart], [PayableDate], [created_at], [Status]) VALUES (75, 2, 6, 2, N'4,5,6,7', 1, 500000, N'Thanh toán tại quầy', N'Nguyễn Văn A', 2, N'vanhungdev@gmail.com', N'0975271384', 0, 2700000, 2950000, 7, 1, CAST(0xAD9302AA AS SmallDateTime), CAST(0xAD930000 AS SmallDateTime), CAST(0xAD9A02A9 AS SmallDateTime), CAST(0xAD9302A9 AS SmallDateTime), 0)
INSERT [dbo].[LeaseOrder] ([ID], [LeaseItemID], [UserId], [StatusPayment], [SoftWare], [IsCancel], [Deposits], [PaymentMethod], [Name], [Comfirm], [Emal], [Phone], [isTransport], [TotalReturn], [TotalPrice], [RentalPeriod], [ComfirmReturn], [ReturnDate], [DayStart], [PayableDate], [created_at], [Status]) VALUES (76, 2, 6, 2, N'4,5,6,7', 2, 500000, N'Thanh toán tại quầy', N'Nguyễn Văn A', 2, N'vanhungdev@gmail.com', N'0975271384', 0, 0, 2200000, 4, 0, CAST(0xAD9702A9 AS SmallDateTime), CAST(0xAD970000 AS SmallDateTime), CAST(0xAD9702A9 AS SmallDateTime), CAST(0xAD9302A9 AS SmallDateTime), 0)
INSERT [dbo].[LeaseOrder] ([ID], [LeaseItemID], [UserId], [StatusPayment], [SoftWare], [IsCancel], [Deposits], [PaymentMethod], [Name], [Comfirm], [Emal], [Phone], [isTransport], [TotalReturn], [TotalPrice], [RentalPeriod], [ComfirmReturn], [ReturnDate], [DayStart], [PayableDate], [created_at], [Status]) VALUES (77, 2, 6, 2, N'4', 1, 500000, N'Thanh toán tại quầy', N'Nguyễn Văn A', 2, N'vanhungdev@gmail.com', N'0975271384', 1, 0, 2200000, 6, 0, CAST(0xAD9902AD AS SmallDateTime), CAST(0xAD930000 AS SmallDateTime), CAST(0xAD9902AD AS SmallDateTime), CAST(0xAD9302AD AS SmallDateTime), 0)
SET IDENTITY_INSERT [dbo].[LeaseOrder] OFF
SET IDENTITY_INSERT [dbo].[LeaseSoftware] ON 

INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (1, 1, N'Phần mềm văn phòng', N'Microsoft Office', 750000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (2, 1, N'Phần mềm gõ tiếng việt', N'UniKey ', 15000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (3, 1, N'Phần mềm giải nén file', N'WinRAR ', 50000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (4, 2, N'Phần mềm Adobe Photoshop', N'Adobe Photoshop', 200000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (5, 2, N'Adobe Illustrator', N'Adobe Illustrator', 150000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (6, 2, N'Adobe Indesign', N'Adobe Indesign', 150000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (7, 2, N'Autocad', N'Autocad', 200000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (8, 2, N'Canva', N'Canva', 150000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (9, 3, N'Adobe Premiere Pro', N'Adobe Premiere Pro', 250000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (10, 4, N'Adobe Premiere Pro', N'Adobe Premiere Pro', 150000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (11, 3, N'Phần mềm đồ họa Revit', N'Revit', 200000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (12, 5, N'Phần mềm dựng phim 3DS MASK', N'3ds mask', 200000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (13, 1, N'Vectr', N'Vectr', 150000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (14, 5, N'SEKIRO: SHADOW DIE TWICE', N'SEKIRO: SHADOW DIE TWICE', 800000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (15, 5, N'THE WITCHER 3: WILD HUNT', N'THE WITCHER 3: WILD HUNT', 400000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (16, 6, N'DARK SOULS 3', N'DARK SOULS 3', 450000)
INSERT [dbo].[LeaseSoftware] ([ID], [CatId], [Description], [Name], [Price]) VALUES (17, 6, N'MONSTER HUNTER: WORLD', N'MONSTER HUNTER: WORLD', 650000)
SET IDENTITY_INSERT [dbo].[LeaseSoftware] OFF
SET IDENTITY_INSERT [dbo].[link] ON 

INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (269, N'ram---bo-nho-trong', 2, N'category', 24)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (270, N'case---vo-may-tinh', 2, N'category', 29)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (271, N'cpu---bo-vi-xu-ly', 2, N'category', 23)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (272, N'vga---card-man-hinh', 2, N'category', 25)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (273, N'o-cung-hdd', 2, N'category', 28)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (274, N'o-cung-ssd', 2, N'category', 26)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (275, N'gioi-thieu', 3, N'Topic', 1)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (276, N'tin-tuc', 3, N'Topic', 16)
SET IDENTITY_INSERT [dbo].[link] OFF
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (1, N'Trang Chủ', N'menu', N'', 2, 0, 1, N'mainmenu', CAST(0xAA110000 AS SmallDateTime), 1, CAST(0xAB1A030F AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (3, N'Liên Hệ', N'page', N'lien-he', 2, 0, 3, N'mainmenu', CAST(0xAA110000 AS SmallDateTime), 1, CAST(0xAA110000 AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (4, N'Sản Phẩm', N'menu', N'san-pham', 2, 0, 4, N'mainmenu', CAST(0xAA110000 AS SmallDateTime), 1, CAST(0xAA110000 AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (5, N'Bài Viết', N'menu', N'bai-viet', 2, 0, 5, N'mainmenu', CAST(0xAA110000 AS SmallDateTime), 1, CAST(0xABB30566 AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (6, N'Tất Cả Sản Phẩm', N'menu', N'sanpham', 2, 4, 10, N'mainmenu', CAST(0xAA110000 AS SmallDateTime), 1, CAST(0xAB180548 AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (7, N'CPU - BỘ VI XỬ LÝ', N'menu', N'cpu---bo-vi-xu-ly', 2, 4, 13, N'mainmenu', CAST(0xAA110000 AS SmallDateTime), 1, CAST(0xABB2054F AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (8, N'RAM - BỘ NHỚ TRONG', N'menu', N'ram---bo-nho-trong', 2, 4, 14, N'mainmenu', CAST(0xAA110000 AS SmallDateTime), 1, CAST(0xABB20550 AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (10, N'VGA - CARD MÀN HÌNH', N'menu', N'vga---card-man-hinh', 2, 4, 12, N'mainmenu', CAST(0xAA110000 AS SmallDateTime), 1, CAST(0xABB102A7 AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[menu] OFF
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (20, N'5727111/24/2020 2:05:48 PM', 1, CAST(0xAC7D034E AS SmallDateTime), CAST(0xAC7D034E AS SmallDateTime), N'Cát minh - Phù cát - Bình định', N'nguyen van hung', N'0975271384', N'vanhung3339@gmial.com', N'COD', 2, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (21, N'9869111/24/2020 2:06:09 PM', 1, CAST(0xAC7D034E AS SmallDateTime), CAST(0xAC7D034E AS SmallDateTime), N'Cát minh - Phù cát - Bình định', N'nguyen van hung', N'0975271384', N'vanhung3339@gmial.com', N'ATM Online qua ngân lượng', 2, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (22, N'4473211/24/2020 2:50:36 PM', 1, CAST(0xAC7D037B AS SmallDateTime), CAST(0xAC7D037B AS SmallDateTime), N'Cát minh - Phù cát - Bình định', N'nguyen van hung', N'0975271384', N'vanhung3339@gmial.com', N'Cổng thanh toán Ngân Lượng', 1, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (23, N'549738/1/2021 11:48:33 PM', 1, CAST(0xAD770595 AS SmallDateTime), CAST(0xAD770595 AS SmallDateTime), N'Cát Minh - Phù Cát - Bình Định', N'Nguyen Van Hung', N'0975271384', N'vanhungdev@gmail.com', N'ATM Online qua ngân lượng', 2, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (24, N'524378/1/2021 11:52:07 PM', 1, CAST(0xAD770598 AS SmallDateTime), CAST(0xAD770598 AS SmallDateTime), N'Cát Minh - Phù Cát - Bình Định', N'Nguyen Van Hung', N'0975271384', N'vanhungdev@gmail.com', N'COD', 2, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (25, N'898078/1/2021 11:53:07 PM', 1, CAST(0xAD770599 AS SmallDateTime), CAST(0xAD770599 AS SmallDateTime), N'Cát Minh - Phù Cát - Bình Định', N'Nguyen Van Hung', N'0975271384', N'vanhungdev@gmail.com', N'ATM Online qua ngân lượng', 1, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (26, N'987928/2/2021 12:33:09 AM', 1, CAST(0xAD780021 AS SmallDateTime), CAST(0xAD780021 AS SmallDateTime), N'Cát Minh - Phù Cát - Bình Định', N'Nguyen Van Hung', N'0975271384', N'vanhungdev@gmail.com', N'COD', 2, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (27, N'85628/2/2021 12:39:28 AM', 1, CAST(0xAD780027 AS SmallDateTime), CAST(0xAD780027 AS SmallDateTime), N'Cát Minh - Phù Cát - Bình Định', N'Nguyen Van Hung', N'0975271384', N'vanhungdev@gmail.com', N'COD', 2, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (28, N'926228/2/2021 12:40:59 AM', 1, CAST(0xAD780029 AS SmallDateTime), CAST(0xAD780029 AS SmallDateTime), N'Cát Minh - Phù Cát - Bình Định', N'Nguyen Van Hung', N'0975271384', N'vanhungdev@gmail.com', N'COD', 2, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (29, N'975308/2/2021 12:42:10 AM', 1, CAST(0xAD78002A AS SmallDateTime), CAST(0xAD78002A AS SmallDateTime), N'Cát Minh - Phù Cát - Bình Định', N'Nguyen Van Hung', N'0975271384', N'vanhungdev@gmail.com', N'ATM Online qua ngân lượng', 1, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (30, N'585058/2/2021 12:50:55 AM', 1, CAST(0xAD780033 AS SmallDateTime), CAST(0xAD780033 AS SmallDateTime), N'Cát Minh - Phù Cát - Bình Định', N'Nguyễn Văn A', N'333333333333333', N'vanhungdev@gmail.com', N'ATM Online qua ngân lượng', 1, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (31, N'939848/8/2021 9:33:04 PM', 1, CAST(0xAD7E050E AS SmallDateTime), CAST(0xAD7E050E AS SmallDateTime), N'Cát Minh - Phù Cát - Bình Định', N'Nguyễn Văn A', N'0975271384', N'vanhungdev@gmail.com', N'COD', 2, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (32, N'904678/8/2021 9:36:35 PM', 1, CAST(0xAD7E0511 AS SmallDateTime), CAST(0xAD7E0511 AS SmallDateTime), N'Cát Minh - Phù Cát - Bình Định', N'Nguyễn Văn A', N'0975271384', N'vanhungdev@gmail.com', N'ATM Online qua ngân lượng', 1, CAST(0xAD7E052F AS SmallDateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[order] OFF
SET IDENTITY_INSERT [dbo].[ordersdetail] ON 

INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (141, 20, 27, 1699000, 1, 10, 1529100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (142, 21, 27, 1699000, 1, 10, 1529100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (143, 22, 32, 1049000, 1, 10, 944100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (144, 23, 30, 4399000, 1, 10, 3959100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (145, 24, 31, 2299000, 1, 10, 2069100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (146, 25, 32, 1049000, 1, 10, 944100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (147, 26, 32, 1049000, 1, 10, 944100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (148, 26, 27, 1699000, 1, 10, 1529100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (149, 27, 32, 1049000, 1, 10, 944100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (150, 27, 27, 1699000, 1, 10, 1529100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (151, 28, 32, 1049000, 1, 10, 944100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (152, 28, 27, 1699000, 1, 10, 1529100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (153, 29, 32, 1049000, 1, 10, 944100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (154, 29, 27, 1699000, 1, 10, 1529100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (155, 30, 27, 1699000, 1, 10, 1529100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (156, 30, 32, 1049000, 1, 10, 944100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (157, 31, 31, 2299000, 2, 10, 1839200)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (158, 31, 30, 4399000, 1, 10, 3959100)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (159, 32, 27, 1699000, 1, 10, 1529100)
SET IDENTITY_INSERT [dbo].[ordersdetail] OFF
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([ID], [topid], [title], [slug], [detail], [img], [type], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (26, 16, N'Tuyển dụng', N'tuyen-dung', N'<div data-v-bfbcefa4="" class="top-img" style="outline: none; word-break: break-word; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, &quot;Droid Sans&quot;, Arial, sans-serif; font-size: 15px;"><h2 style="color: rgb(10, 10, 10); width: 779.1px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Roboto, sans-serif;"><div id="vc_row-5fbca15fea87e" class="vc_row wpb_row vc_row-fluid" style="margin-left: -21px; margin-right: -21px; margin-bottom: 1.1em; position: relative; color: rgb(51, 51, 51); font-family: Montserrat; font-size: 16px;"><div class="wpb_column vc_column_container vc_col-sm-12" style="width: 1224px; position: relative; min-height: 1px; padding-left: 0px; padding-right: 0px; float: left;"><div class="vc_column-inner " style="padding-left: 15px; padding-right: 15px; width: 1224px; padding-top: 35px;"><div class="wpb_wrapper"><div class="wpb_text_column wpb_content_element " style="margin-bottom: 1.1em;"><div class="wpb_wrapper" style="margin-bottom: 0px;"><p style="margin-right: 0px; margin-bottom: 1.1em; margin-left: 0px; text-align: center;"><span style="margin-bottom: 0px; font-family: Montserrat, helvetica, sans-serif; font-size: 32pt; font-weight: 600; line-height: 1.5;">BẠN THẤY MÌNH PHÙ HỢP Ở VỊ TRÍ NÀO?</span></p><div class="hnc_separator_dark" style="text-align: center; border-top: 3px dashed rgb(51, 51, 51); width: 200px; margin: 2rem auto 0px;"></div></div></div><div class="vc_empty_space" style="height: 12px;"><span class="vc_empty_space_inner"></span></div></div></div></div></div><div class="vc_row-full-width-before" style="color: rgb(51, 51, 51); font-family: Montserrat; font-size: 16px;"></div><div id="vc_row-5fbca15feb0fe" data-vc-full-width="true" data-vc-full-width-init="true" data-vc-stretch-content="true" class="vc_row wpb_row vc_row-fluid thong-tin-tuyen-dung" style="padding: 0px 45px 0px 60px; margin-left: -21px; margin-right: -21px; margin-bottom: 1.1em; position: relative; transition: opacity 0.5s ease 0s; overflow: hidden; color: rgb(51, 51, 51); font-family: Montserrat; font-size: 16px; left: -147.6px; width: 1519px;"><div class="wpb_column vc_column_container vc_col-sm-12" style="width: 1414px; position: relative; min-height: 1px; padding-left: 0px; padding-right: 0px; float: left;"><div class="vc_column-inner " style="padding-left: 15px; padding-right: 15px; width: 1414px;"><div class="wpb_wrapper"><div id="advanced-tabs-desc-wrap-8623" class="ult_tabs  animated Slide delay-undefined ult_aniamte" data-tabsstyle="style1" data-titlebg="#e7ecea" data-titlecolor="#74777b" data-fullheight="off" data-titlehoverbg="#eff4f2" data-titlehovercolor="#6b6f72" data-rotatetabs="0" data-responsivemode="Both" data-animation="Slide" data-activetitle="#ffffff" data-activeicon="" data-activebg="#ff3333" data-respmode="Tabs" data-respwidth="400" data-scroll="on" data-activeindex="1" style="animation-duration: 1s; animation-fill-mode: both; clear: both; position: relative; width: 1384px; padding: 0px; margin: 0px auto auto;"><ul id="advanced-tabs-wrap-3549" class="ult_tabmenu style1  active" style="position: relative; overflow: hidden; width: 1200px; display: flex; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding: 0px; max-width: 1200px; list-style: none; flex-flow: wrap; justify-content: left;"><li class="ult_tab_li current" data-iconcolor="#74777b" data-iconhover="#ffffff" style="display: inline-block; position: relative; float: left; list-style: none; overflow: hidden; margin: 0px; padding: 0px; width: 400px; background-color: rgb(231, 236, 234); border-color: transparent; border-width: 0px; border-style: solid; border-top-left-radius: 0px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung/#1563352231945-3" id="1563352231945-3" class="ult_a   false _mPS2id-t _mPS2id-h" style="background: rgb(255, 51, 51); color: rgb(255, 255, 255); transition: background-color 0.3s ease 0s; text-align: center; text-overflow: ellipsis; white-space: nowrap; outline: 0px; font-size: inherit; font-weight: inherit; float: left; display: block; padding: 10px; width: 400px;"><span class="ult_tab_main Both " style="display: table; color: inherit; width: 380px;"><span class="ult_tab_section" style="display: table-cell; vertical-align: middle; color: inherit; width: 380px;"><span data-ultimate-target="#advanced-tabs-wrap-3549 .ult-span-text" data-responsive-json-new="{&quot;font-size&quot;:&quot;desktop:18px;&quot;,&quot;line-height&quot;:&quot;&quot;}" class="ult-span-text no_icon ult_tab_display_text ult-responsive" style="vertical-align: middle; line-height: 1em; color: inherit; width: 100%; transition: all 0.3s ease-in-out 0s; font-size: 18px; font-weight: bold;">Hà Nội</span></span></span></a></li><li class="ult_tab_li" data-iconcolor="#74777b" data-iconhover="#ffffff" style="display: inline-block; position: relative; float: left; list-style: none; overflow: hidden; margin: 0px; padding: 0px; width: 400px; border-width: 0px; border-style: solid; border-color: transparent; background-color: rgb(231, 236, 234);"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung/#1563352232074-8" id="1563352232074-8" class="ult_a   false _mPS2id-t _mPS2id-h" style="background: rgb(231, 236, 234); color: rgb(116, 119, 123); transition: background-color 0.3s ease 0s; text-align: center; text-overflow: ellipsis; white-space: nowrap; outline: 0px; font-size: inherit; font-weight: inherit; float: left; display: block; padding: 10px; width: 400px;"><span class="ult_tab_main Both " style="display: table; color: inherit; width: 380px;"><span class="ult_tab_section" style="display: table-cell; vertical-align: middle; color: inherit; width: 380px;"><span data-ultimate-target="#advanced-tabs-wrap-3549 .ult-span-text" data-responsive-json-new="{&quot;font-size&quot;:&quot;desktop:18px;&quot;,&quot;line-height&quot;:&quot;&quot;}" class="ult-span-text no_icon ult_tab_display_text ult-responsive" style="vertical-align: middle; line-height: 1em; color: inherit; width: 100%; transition: all 0.3s ease-in-out 0s; font-size: 18px; font-weight: bold;">Hải Phòng</span></span></span></a></li><li class="ult_tab_li" data-iconcolor="#74777b" data-iconhover="#ffffff" style="display: inline-block; position: relative; float: left; list-style: none; overflow: hidden; margin: 0px; padding: 0px; width: 400px; border-width: 0px; border-style: solid; border-color: transparent; background-color: rgb(231, 236, 234); border-top-right-radius: 0px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung/#1563352510760-2-3" id="1563352510760-2-3" class="ult_a   false _mPS2id-t _mPS2id-h" style="background: rgb(231, 236, 234); color: rgb(116, 119, 123); transition: background-color 0.3s ease 0s; text-align: center; text-overflow: ellipsis; white-space: nowrap; outline: 0px; font-size: inherit; font-weight: inherit; float: left; display: block; padding: 10px; width: 400px;"><span class="ult_tab_main Both " style="display: table; color: inherit; width: 380px;"><span class="ult_tab_section" style="display: table-cell; vertical-align: middle; color: inherit; width: 380px;"><span data-ultimate-target="#advanced-tabs-wrap-3549 .ult-span-text" data-responsive-json-new="{&quot;font-size&quot;:&quot;desktop:18px;&quot;,&quot;line-height&quot;:&quot;&quot;}" class="ult-span-text no_icon ult_tab_display_text ult-responsive" style="vertical-align: middle; line-height: 1em; color: inherit; width: 100%; transition: all 0.3s ease-in-out 0s; font-size: 18px; font-weight: bold;">TP. Hồ Chí Minh</span></span></span></a></li></ul><div data-ultimate-target="#advanced-tabs-desc-wrap-8623 .ult_tabcontent .ult_tab_min_contain  p" data-responsive-json-new="{&quot;font-size&quot;:&quot;&quot;,&quot;line-height&quot;:&quot;&quot;}" class="ult_tabcontent ult-responsive style1" style="color: rgb(116, 119, 123);"><div class="ult_tab_min_contain "><div class="ult_tabitemname" style="position: relative; margin: 0px; padding: 12px 15px; color: inherit; overflow: hidden;"><div class="wpb_text_column wpb_content_element " style="margin-bottom: 1.1em;"><div class="wpb_wrapper" style="margin-bottom: 0px;"><table width="99%" style="border-spacing: 0px; margin-top: 0px; margin-bottom: 0px; width: 1340px; height: 617px;"><tbody style="margin-bottom: 0px;"><tr style="height: 50px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 50px;"><strong style="font-weight: bold; margin-bottom: 0px;">STT</strong></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 50px;"><strong style="font-weight: bold; margin-bottom: 0px;">Vị trí đang tuyển</strong></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 50px;"><strong style="font-weight: bold; margin-bottom: 0px;">SL tuyển</strong></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 50px;"><strong style="font-weight: bold; margin-bottom: 0px;">Mức lương</strong></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 50px;"><strong style="font-weight: bold; margin-bottom: 0px;">Thời hạn nộp hồ sơ</strong></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 50px;"><strong style="font-weight: bold; margin-bottom: 0px;">Nơi làm việc</strong></td></tr><tr style="height: 164px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 164px;">01</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 164px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung-nhan-vien-ky-thuat-bao-hanh-4/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Nhân viên Kỹ thuật lắp đặt phần cứng</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 164px;">05</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 164px;">8.000.000 đ – 11.000.000 đ</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 164px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 164px;">Hà Nội (Hai Bà Trưng/Đống Đa/Hà Đông)</td></tr><tr style="height: 23px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 23px;">02</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 23px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung-phu-trach-camerathiet-bi-an-ninh-chi-nhanh-2/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Nhân viên Kinh doanh Camera</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 23px;">02</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 23px;">8.000.000 đ - 15.000.000 đ</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 23px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 23px;">Hà Nội (Đống Đa)</td></tr><tr style="height: 48px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 48px;">03</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 48px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung-thuc-tap-sinh-cong-tac-vien-noi-dung/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Tuyển dụng Thực tập sinh + Công tác viên nội dung</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 48px;">02</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 48px;">6.000.000 đ – 10.000.000 đ</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 48px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 48px;">Hà Nội (Đống Đa)</td></tr><tr style="height: 58px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 58px;">04</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 58px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung-nhan-vien-quay-phim/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Nh<span style="font-family: Verdana, Arial, Helvetica, sans-serif;">â</span>n vi<span style="margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif;">ê</span>n quay phim</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 58px;">01</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 58px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">8.000.000 đ – 15.000.000 đ</span></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 58px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 58px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">Hà Nội (Đống Đa)</span></td></tr><tr style="height: 46px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 46px;">05</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 46px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung-lai-xe-giao-van/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Nhân viên Lái xe Giao vận</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 46px;">01</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">8.000.000 đ – 9.000.000 đ</span></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">Hà Nội (Hai Bà Trưng)</span></td></tr><tr style="height: 22px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 22px;">06</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 22px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung-nhan-vien-kinh-doanh-online-2/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Nhân viên Kinh doanh Online</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 22px;">01</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 22px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">8.500.000 đ – 10.000.000 đ</span></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 22px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 22px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">Hà Nội (Hai Bà Trưng)</span></td></tr><tr style="height: 46px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 46px;">07</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 46px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung-nhan-vien-hau-ki/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Nhân viên Hậu kỳ</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 46px;">02</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">9.000.000 đ – 15.000.000 đ</span></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">Hà Nội (Đống Đa)</span></td></tr><tr style="height: 46px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 46px;">08</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 46px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung-nhan-vien-ky-thuat-camera-3/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Nhân viên Kỹ thuật Camera</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 46px;">02</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">8.000.000 đ – 11.000.000 đ</span></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">Hà Nội (Đống Đa)</span></td></tr><tr style="height: 46px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 46px;">09</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 46px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung-nhan-vien-marketing-noi-dung/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Nhân viên Digital Marketing (Facebook Ads, Google, Zalo,...)</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 46px;">01</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">8.000.000 đ – 10.000.000 đ</span></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">Hà Nội (Đống Đa)</span></td></tr><tr style="height: 46px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 46px;">10</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 46px;"><a href="https://thongtin.hanoicomputer.vn/tuyen-dung-nhan-vien-kinh-doanh-ban-le-3/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Nhân viên Kinh doanh Bán lẻ</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 46px;">01</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">8.000.000 đ – 12.000.000 đ</span></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 46px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">Hà Nội (Cầu Giấy)</span></td></tr><tr style="margin-bottom: 0px; height: 22px;"><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 52px; height: 22px;">11</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 447.2px; height: 22px;"><a href="https://thongtin.hanoicomputer.vn/nhan-vien-thuc-tap-ky-thuat/" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 51, 51); transition: color 0.3s ease 0s, background-color 0.3s ease 0s; margin-bottom: 0px;">Thực tập sinh Kỹ thuật-Bảo hành</a></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 76.8px; height: 22px;">05</td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 252px; height: 22px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">2.500.000 đ</span></td><td style="padding: 5px 10px; border: 1px solid rgb(223, 229, 232); width: 157.6px; height: 22px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">30/11/2020</span></td><td style="padding: 5px 10px; margin-bottom: 0px; border: 1px solid rgb(223, 229, 232); width: 353.6px; height: 22px;"><span style="margin-bottom: 0px; color: rgb(51, 51, 51); cursor: text; font-family: Arial, &quot;Times New Roman&quot;, &quot;Bitstream Charter&quot;, Times, serif; font-variant-numeric: normal; font-variant-east-asian: normal;">Hà Nội (Đống Đa/Long Biên)</span></td></tr></tbody></table></div></div></div></div></div></div></div></div></div></div></h2></div>', N'tintuc/tuyen-dung.PNG', NULL, N'metakey', N'metadesc', CAST(0xA9F50000 AS SmallDateTime), 9, CAST(0xAC7D0316 AS SmallDateTime), 1, 1)
INSERT [dbo].[post] ([ID], [topid], [title], [slug], [detail], [img], [type], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (29, 1, N'Giới thiệu', N'gioi-thieu', N'<header class="entry-header" style="color: rgb(40, 40, 40); font-family: Roboto, sans-serif;"><div class="entry-header-text entry-header-text-top text-left" style="padding: 0px 0px 1.5em;"><h1 class="hnc-static-heading1" style="font-weight: 700; position: relative; text-align: center; font-size: 36px; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;">GIỚI THIỆU VỀ HANOICOMPUTER</h1><h3 class="hnc-static-headding3" 1.="" giới="" thiệu="" chung="" style="font-weight: 700; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;"></h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><p style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"><span style="font-weight: 700;">Công ty Cổ phần Máy tính Hà Nội</span>* là một trong những doanh nghiệp tiên phong trong lĩnh vực Công nghệ thông tin tại Hà Nội.</p><p style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;">*gọi tắt là “<span style="font-weight: 700;">HNC</span>” hoặc “<span style="font-weight: 700;">HANOICOMPUTER</span>”</p><p style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;">Với tầm nhìn dài hạn, HANOICOMPUTER tập trung đầu tư vào lĩnh vực Công nghệ thông tin. Trên tinh thần phát triển bền vững và chuyên nghiệp, HANOICOMPUTER được cơ cấu với các sản phẩm kinh doanh chính gồm:</p><ul style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"><li style="list-style-type: none;">Laptop &amp; Phụ kiện</li><li style="list-style-type: none;">Máy tính văn phòng</li><li style="list-style-type: none;">Máy tính chơi Game</li><li style="list-style-type: none;">Máy chủ, Máy trạm</li><li style="list-style-type: none;">Linh kiện máy tính</li><li style="list-style-type: none;">Monitor – Màn hình</li><li style="list-style-type: none;">Gaming Gear &amp; Console</li><li style="list-style-type: none;">Tản nhiệt – Cooling</li><li style="list-style-type: none;">Thiết bị văn phòng</li><li style="list-style-type: none;">Thiết bị Nghe Nhìn Giải Trí</li><li style="list-style-type: none;">Thiết bị Siêu thị, Cửa hàng</li><li style="list-style-type: none;">Thiết bị Hội Nghị, Trường Học</li><li style="list-style-type: none;">Camera An Ninh</li><li style="list-style-type: none;">Nhà Thông Minh</li><li style="list-style-type: none;">Thiết bị Lưu trữ</li><li style="list-style-type: none;">Thiết bị Mạng, Phần mềm</li><li style="list-style-type: none;">Phụ kiện các loại</li></ul></h6><h3 class="hnc-static-heading3" style="font-weight: 700; font-size: 20px; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;">2. Giá trị cốt lõi</h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><p style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;">Văn hóa HANOICOMPUTER được thể hiện qua bốn giá trị cốt lõi:&nbsp;<span style="color: rgb(0, 0, 128);"><span style="font-weight: 700;">TẬN TÂM – TRÁCH NHIỆM – SÁNG TẠO – KHÁC BIỆT</span></span></p><div class="hnc-static-equal" style="width: 1094.4px; margin: auto; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"><div class="hnc-static-all-center hnc-static-equal-half" style="text-align: center; margin: 15px; width: 492.475px; padding: 15px; display: inline-block; background-color: rgb(250, 140, 17);"><img src="https://www.hanoicomputer.vn/media/lib/gia-tri-cot-loi-my-4-150x150.jpg" alt="" width="150" height="150" class="hnc-static-round-img" style="border-width: initial; border-color: initial; border-image: initial; max-width: 100%; height: auto; margin-top: 15px; border-radius: 50%;"></div></div></h6><h3 class="hnc-static-brand-text" style="font-weight: bold; font-size: 36px; color: white;">TẬN TÂM</h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><div class="hnc-static-equal" style="width: 1094.4px; margin: auto; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"><div class="hnc-static-all-center hnc-static-equal-half" style="text-align: center; margin: 15px; width: 492.475px; padding: 15px; display: inline-block; background-color: rgb(250, 140, 17);"><p class="hnc-static-slogan-text" style="font-weight: bold; font-size: 20px; color: white;"><em>“Vượt trên sự mong đợi”</em></p><p class="hnc-static-explain-text" style="color: white;">HANOICOMPUTER đặt tận tâm là nền tảng của phục vụ, lấy khách hàng làm trung tâm, mang đến những giá trị đích thực tới khách hàng và đối tác.</p></div>&nbsp;<div class="hnc-static-all-center hnc-static-equal-half" style="text-align: center; margin: 15px; width: 492.475px; padding: 15px; display: inline-block; background-color: rgb(236, 25, 34);"><img src="https://www.hanoicomputer.vn/media/lib/gia-tri-cot-loi-my-5-150x150.jpg" alt="" width="150" height="150" class="hnc-static-round-img" style="border-width: initial; border-color: initial; border-image: initial; max-width: 100%; height: auto; margin-top: 15px; border-radius: 50%;"></div></div></h6><h3 class="hnc-static-brand-text" style="font-weight: bold; font-size: 36px; color: white;">TRÁCH NHIỆM</h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><div class="hnc-static-equal" style="width: 1094.4px; margin: auto; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"><div class="hnc-static-all-center hnc-static-equal-half" style="text-align: center; margin: 15px; width: 492.475px; padding: 15px; display: inline-block; background-color: rgb(236, 25, 34);"><p class="hnc-static-slogan-text" style="font-weight: bold; font-size: 20px; color: white;"><em>“Chúng ta luôn cố gắng”</em></p><p class="hnc-static-explain-text" style="color: white;">HANOICOMPUTER đặt chữ TÍN lên hàng đầu, luôn thể hiện tinh thần trách nhiệm cao cùng phương châm “Làm hết việc chứ không làm hết giờ”.</p></div>&nbsp;<div class="hnc-static-all-center hnc-static-equal-half" style="text-align: center; margin: 15px; width: 492.475px; padding: 15px; display: inline-block; background-color: rgb(38, 169, 225);"><img src="https://www.hanoicomputer.vn/media/lib/gia-tri-cot-loi-my-7-150x150.jpg" alt="" width="150" height="150" class="hnc-static-round-img" style="border-width: initial; border-color: initial; border-image: initial; max-width: 100%; height: auto; margin-top: 15px; border-radius: 50%;"></div></div></h6><h3 class="hnc-static-brand-text" style="font-weight: bold; font-size: 36px; color: white;">KHÁC BIỆT</h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><div class="hnc-static-equal" style="width: 1094.4px; margin: auto; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"><div class="hnc-static-all-center hnc-static-equal-half" style="text-align: center; margin: 15px; width: 492.475px; padding: 15px; display: inline-block; background-color: rgb(38, 169, 225);"><p class="hnc-static-slogan-text" style="font-weight: bold; font-size: 20px; color: white;"><em>“Dám nghĩ – Dám làm”</em></p><p class="hnc-static-explain-text" style="color: white;">HANOICOMPUTER đặt sự khác biệt là chủ trương để xây dựng công ty thành một doanh nghiệp dẫn đầu.</p></div>&nbsp;<div class="hnc-static-all-center hnc-static-equal-half" style="text-align: center; margin: 15px; width: 492.475px; padding: 15px; display: inline-block; background-color: rgb(36, 33, 86);"><img src="https://www.hanoicomputer.vn/media/lib/gia-tri-cot-loi-my-6-150x150.jpg" alt="" width="150" height="150" class="hnc-static-round-img" style="border-width: initial; border-color: initial; border-image: initial; max-width: 100%; height: auto; margin-top: 15px; border-radius: 50%;"></div></div></h6><h3 class="hnc-static-brand-text" style="font-weight: bold; font-size: 36px; color: white;">SÁNG TẠO</h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><div class="hnc-static-equal" style="width: 1094.4px; margin: auto; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"><div class="hnc-static-all-center hnc-static-equal-half" style="text-align: center; margin: 15px; width: 492.475px; padding: 15px; display: inline-block; background-color: rgb(36, 33, 86);"><p class="hnc-static-slogan-text" style="font-weight: bold; font-size: 20px; color: white;"><em>“Không gì là không thể”</em></p><p class="hnc-static-explain-text" style="color: white;">HANOICOMPUTER coi sáng tạo là đòn bẩy để phát triển, luôn đề cao các sáng kiến để hoàn thiện, hiệu quả hơn, nâng tầm giá trị.</p></div></div></h6><h3 class="hnc-static-heading3" style="font-weight: 700; font-size: 20px; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;">3. Những dấu mốc quan trọng</h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><ul style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"><li style="list-style-type: none;"><span style="font-weight: 700;"><span style="color: rgb(0, 0, 128);">2001</span></span>: Thành lập công ty TNHH MÁY TÍNH HÀ NỘI</li><li style="list-style-type: none;"><span style="font-weight: 700;"><span style="color: rgb(0, 0, 128);">2007</span></span>: Áp dụng ISO 9000:2001, Hệ thống tiêu chuẩn quản lý chất lượng sản phẩm trên toàn cầu</li><li style="list-style-type: none;"><span style="color: rgb(0, 0, 128);"><span style="font-weight: 700;">2010</span></span>: Khai trương Showroom thứ hai tại 43 Thái Hà – Đống Đa – Hà Nội</li><li style="list-style-type: none;"><span style="color: rgb(0, 0, 128);"><span style="font-weight: 700;">2014</span></span>: Cổ phần hóa công ty, đổi tên thành CÔNG TY CỔ PHẦN MÁY TÍNH HÀ NỘI</li><li style="list-style-type: none;"><span style="color: rgb(0, 0, 128);"><span style="font-weight: 700;">2016</span></span>: Khai trương Showroom thứ ba tại A1-6 Lô 8A – Lê Hồng Phong – Ngô Quyền – Hải Phòng</li><li style="list-style-type: none;"><span style="color: rgb(0, 0, 128);"><span style="font-weight: 700;">2017</span></span>: Khai trương Showroom thứ tư tại 77 + 79 Nguyễn Văn Huyên – Cầu Giấy – Hà Nội</li><li style="list-style-type: none;"><span style="color: rgb(0, 0, 128);"><span style="font-weight: 700;">2018</span></span>: Khai trương Showroom thứ năm tại 511+513 Quang Trung – Hà Đông – Hà Nội</li><li style="list-style-type: none;"><span style="color: rgb(0, 0, 128);"><span style="font-weight: 700;">2019</span></span>: Khai trương Showroom thứ sáu tại 520 đường Cách Mạng Tháng Tám – Quận 3 – Hồ Chí Minh</li><li style="list-style-type: none;"><span style="color: rgb(0, 0, 128);"><span style="font-weight: 700;">2020</span></span>: Khai trương Showroom thứ bảy tại 398 Nguyễn Văn Cừ - Long Biên - Hà Nội</li></ul></h6><h3 class="hnc-static-heading3" style="font-weight: 700; font-size: 20px; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;">4. Sơ đồ tổ chức</h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><img class="hnc-static-image" src="https://www.hanoicomputer.vn/media/lib/so-do-hnc.jpg" style="border-width: initial; border-color: initial; border-image: initial; max-width: 100%; height: auto; width: auto; margin: 0px auto; display: block; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"></h6><h3 class="hnc-static-heading3" style="font-weight: 700; font-size: 20px; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;">5. Các lĩnh vực kinh doanh</h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><ul style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none; list-style-type: circle;"><li style="list-style-type: none;"><span style="color: rgb(0, 0, 128);">Tin học</span></li><li style="list-style-type: none;"><span style="color: rgb(0, 0, 128);">Điện tử</span></li><li style="list-style-type: none;"><span style="color: rgb(0, 0, 128);">Viễn thông</span></li></ul><p style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;">Đặc biệt trong lĩnh vực tin học Công ty chú trọng các hoạt động như:</p><ul style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"><li style="list-style-type: none;">Thiết kế giải pháp tổng thể (thiết kế hệ thống, xây dựng mạng LAN, WAN,..)</li><li style="list-style-type: none;">Cung cấp các thiết bị tin học (Máy chủ, máy tính PC, máy tính NOTEBOOKS, các thiết bị ngoại vi, các ứng dụng)</li><li style="list-style-type: none;">Cung cấp phần mềm của các hãng trên thế giới, các phần mềm quản lý, truyền thông…</li><li style="list-style-type: none;">Tư vấn và đào tạo cho khách hàng</li><li style="list-style-type: none;">Các dịch vụ bảo hành, bảo trì…</li></ul><p style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;">Qua thời gian hoạt động, công ty chúng tôi đã tạo được uy tín và sự tin cậy của khách hàng giúp công ty ngày càng lớn mạnh trong các lĩnh vực hoạt động.</p></h6><h3 class="hnc-static-heading3" style="font-weight: 700; font-size: 20px; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;">6. Những thành tựu đã đạt được</h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><img class="hnc-static-image" src="https://www.hanoicomputer.vn/media/lib/01-10-2020/thanh-tu-banner2.png" style="border-width: initial; border-color: initial; border-image: initial; max-width: 100%; height: auto; width: 948.475px; margin: 0px auto; display: block; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"></h6><h3 class="hnc-static-heading3" style="font-weight: 700; font-size: 20px; color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;">7. Những dự án đã thực hiện</h3><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><p style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;">Qua quá trình hoạt động trong lĩnh vực công nghệ thông tin, Công ty Cổ Phần Máy Tính Hà Nội đã được rất nhiều các cơ quan đơn vị tín nhiệm, điều đó thể hiện qua các dự án mà công ty đã tham gia, trúng thầu và thực hiện. Đơn cử như sau:</p><ul style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;"><li style="list-style-type: none;">Tư vấn và lắp đặt hệ thống mạng máy tính cho Viện Khoa học Kỹ thuật Nông nghiệp Việt Nam.</li><li style="list-style-type: none;">Tư vấn và thiết kế, lắp đặt hệ thống máy tính, máy in và mạng cho Nhà xuất bản Phụ nữ Hà Nội.</li><li style="list-style-type: none;">Cung cấp và lắp đặt hệ thống mạng cho Trường Đại Học Công nghệ – ĐHQGHN.</li><li style="list-style-type: none;">Cung cấp máy tính và thiết bị mạng cho Tổng Công ty Viễn thông Quân Đội.</li><li style="list-style-type: none;">Cung cấp máy tính cho dự án Đào tạo Giáo viên THCS – Bộ Giáo dục và Đào tạo.</li><li style="list-style-type: none;">Là một trong sáu thành viên của Dự án G6 cung cấp máy tính giá ưu đãi cho học sinh, sinh viên.</li><li style="list-style-type: none;">Cung cấp máy tính và thiết bị mạng cho Tòa Án Nhân Dân tỉnh Sơn La.</li><li style="list-style-type: none;">Cung cấp máy tính và thiết bị mạng cho Văn phòng Trung ương hội Nông dân Việt Nam.</li><li style="list-style-type: none;">Cung cấp máy tính và thiết bị mạng cho Công ty Ô tô Toyota Việt Nam.</li><li style="list-style-type: none;">Cung cấp máy tính và thiết bị mạng cho Học viện công nghệ Bưu chính Viễn Thông.</li><li style="list-style-type: none;">Cung cấp máy tính cho Trường Đại học Bách khoa Hà Nội.</li><li style="list-style-type: none;">Cung cấp máy chiếu, máy tính để bàn, phần mềm quản lý giáo dục cho Phòng Giáo dục và Đào tạo Quận Nam Từ Liêm.</li></ul><p style="color: rgb(34, 34, 34); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 13px; letter-spacing: normal; text-transform: none;">Ngoài các dự án, giải pháp trên công ty còn có nhiều hợp đồng cung cấp thiết bị tin học. Công ty đã có quan hệ với hàng nghìn khách hàng và luôn để lại cho khách hàng niềm tin tưởng ở khả năng chuyên môn, lòng nhiệt tình, tính cách chu đáo với các dịch vụ bảo hành bảo trì sau bán hàng.</p></h6></div></header><div class="entry-content single-page" style="padding-top: 0px; padding-bottom: 0px; color: rgb(40, 40, 40); font-family: Roboto, sans-serif;"><div class="aiosrs-rating-wrap" data-schema-id="10822" style="margin-bottom: 10px;"><div class="aiosrs-star-rating-wrap " style="display: inline-block; vertical-align: middle;"><span class="aiosrs-star-rating dashicons dashicons-star-filled" data-index="1" style="font-family: dashicons; display: inline-block; line-height: 1; speak: none; text-decoration: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased; width: 20px; height: 20px; font-size: 20px; vertical-align: top; text-align: center; transition: color 0.1s ease-in 0s; color: gold; cursor: pointer;"></span><span class="aiosrs-star-rating dashicons dashicons-star-filled" data-index="2" style="font-family: dashicons; display: inline-block; line-height: 1; speak: none; text-decoration: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased; width: 20px; height: 20px; font-size: 20px; vertical-align: top; text-align: center; transition: color 0.1s ease-in 0s; color: gold; cursor: pointer;"></span><span class="aiosrs-star-rating dashicons dashicons-star-filled" data-index="3" style="font-family: dashicons; display: inline-block; line-height: 1; speak: none; text-decoration: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased; width: 20px; height: 20px; font-size: 20px; vertical-align: top; text-align: center; transition: color 0.1s ease-in 0s; color: gold; cursor: pointer;"></span><span class="aiosrs-star-rating dashicons dashicons-star-filled" data-index="4" style="font-family: dashicons; display: inline-block; line-height: 1; speak: none; text-decoration: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased; width: 20px; height: 20px; font-size: 20px; vertical-align: top; text-align: center; transition: color 0.1s ease-in 0s; color: gold; cursor: pointer;"></span><span class="aiosrs-star-rating dashicons dashicons-star-filled" data-index="5" style="font-family: dashicons; display: inline-block; line-height: 1; speak: none; text-decoration: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased; width: 20px; height: 20px; font-size: 20px; vertical-align: top; text-align: center; transition: color 0.1s ease-in 0s; color: gold; cursor: pointer;"></span></div></div></div>', N'gioithieu/gioi-thieu.PNG', NULL, N'a', N'a', CAST(0xAC650347 AS SmallDateTime), 1, CAST(0xAC7D0316 AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[post] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (25, 23, 19, N'CPU Intel Core i5-8400', N'cpu-intel-core-i5-8400', N'cpu-bovixuly/cpu-intel-core-i5-8400.jpg', N'Đánh giá sản phẩm CPU Intel Core i5-8400 bá chủ bộ vi xử lý phân khúc tầm trung !', 100, 5400000, 10, N'CPU Intel Core i5-8400', N'CPU Intel Core i5-8400', CAST(0xAC7C036F AS SmallDateTime), 1, CAST(0xAC7C036F AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (26, 23, 1, N'CPU Intel Core i9-9900KF', N'cpu-intel-core-i9-9900kf', N'cpu-bovixuly/cpu-intel-core-i9-9900kf.jpg', N'CPU Intel Core i9-9900KF', 100, 12599000, 1, N'CPU Intel Core i9-9900KF', N'CPU Intel Core i9-9900KF', CAST(0xAC7C0372 AS SmallDateTime), 1, CAST(0xAC7C0372 AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (27, 23, 19, N'CPU Intel Pentium Gold G5420', N'cpu-intel-pentium-gold-g5420', N'cpu-bovixuly/cpu-intel-pentium-gold-g5420.jpg', N'CPU Intel Pentium Gold G5420', 92, 1699000, 10, N'CPU Intel Pentium Gold G5420', N'CPU Intel Pentium Gold G5420', CAST(0xAC7C0373 AS SmallDateTime), 1, CAST(0xAC7C0373 AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (28, 23, 19, N'CPU Intel Core i7-10700F ', N'cpu-intel-core-i7-10700f-', N'cpu-bovixuly/cpu-intel-core-i7-10700f-.jpg', N'CPU Intel Core i7-10700F ', 100, 23999000, 10, N'CPU Intel Core i7-10700F ', N'CPU Intel Core i7-10700F ', CAST(0xAC7C0374 AS SmallDateTime), 1, CAST(0xAC7C0374 AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (29, 23, 19, N'CPU AMD Ryzen 5 3600XT', N'cpu-amd-ryzen-5-3600xt', N'cpu-bovixuly/cpu-amd-ryzen-5-3600xt.jpg', N'CPU AMD Ryzen 5 3600XT', 100, 6300000, 0, N'CPU AMD Ryzen 5 3600XT', N'CPU AMD Ryzen 5 3600XT', CAST(0xAC7C0375 AS SmallDateTime), 1, CAST(0xAC7C0375 AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (30, 24, 19, N'RAM Desktop Gskill Trident Z RGB', N'ram-desktop-gskill-trident-z-rgb', N'ram-bonhotrong/ram-desktop-gskill-trident-z-rgb.jpg', N'RAM Desktop Gskill Trident Z RGB', 98, 4399000, 10, N'RAM Desktop Gskill Trident Z RGB', N'RAM Desktop Gskill Trident Z RGB', CAST(0xAC7C0377 AS SmallDateTime), 1, CAST(0xAC7C0377 AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (31, 24, 19, N'RAM Desktop CORSAIR Vengeance LPX', N'ram-desktop-corsair-vengeance-lpx', N'ram-bonhotrong/ram-desktop-corsair-vengeance-lpx.jpg', N'RAM Desktop CORSAIR Vengeance LPX', 97, 2299000, 10, N'RAM Desktop CORSAIR Vengeance LPX', N'RAM Desktop CORSAIR Vengeance LPX', CAST(0xAC7C0378 AS SmallDateTime), 1, CAST(0xAC7C0378 AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (32, 23, 1, N'Ram laptop CORSAIR ', N'ram-laptop-corsair-', N'cpu-bovixuly/ram-laptop-corsair-(cmsx8gx4m1a2400c16)-8gb-(1x8gb)-ddr4-2400mhz.jpg', N'Ram laptop CORSAIR', 93, 1049000, 10, N'Ram laptop CORSAIR', N'Ram laptop CORSAIR', CAST(0xAC7C037A AS SmallDateTime), 1, CAST(0xAC7C03F0 AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (33, 25, 19, N'Card màn hình ASUS ROG STRIX RX 5600 XT-O6G GAMING', N'card-man-hinh-asus-rog-strix-rx-5600-xt-o6g-gaming', N'vga-cardmanhinh/card-man-hinh-asus-rog-strix-rx-5600-xt-o6g-gaming.jpg', N'Card màn hình ASUS ROG STRIX RX 5600 XT-O6G GAMING', 100, 8999000, 6, N'Card màn hình ASUS ROG STRIX RX 5600 XT-O6G GAMING', N'Card màn hình ASUS ROG STRIX RX 5600 XT-O6G GAMING', CAST(0xAC7C03F2 AS SmallDateTime), 1, CAST(0xAC7C03F2 AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (34, 25, 19, N'Card màn hình GIGABYTE RTX 2060 WF2OC - 6GD', N'card-man-hinh-gigabyte-rtx-2060-wf2oc---6gd', N'vga-cardmanhinh/card-man-hinh-gigabyte-rtx-2060-wf2oc---6gd.jpg', N'Card màn hình GIGABYTE RTX 2060 WF2OC - 6GD', 100, 10699000, 10, N'Card màn hình GIGABYTE RTX 2060 WF2OC - 6GD', N'Card màn hình GIGABYTE RTX 2060 WF2OC - 6GD', CAST(0xAC7C03F2 AS SmallDateTime), 1, CAST(0xAC7C03F2 AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (35, 25, 1, N'Card màn hình MSI GTX 1660 Super VENTUS XS OC ', N'card-man-hinh-msi-gtx-1660-super-ventus-xs-oc-', N'vga-cardmanhinh/card-man-hinh-msi-gtx-1660-super-ventus-xs-oc-.jpg', N'Card màn hình MSI GTX 1660 Super VENTUS XS OC (6GB GDDR6, 192-bit, HDMI+DP)', 150, 15000000, 10, N'Card màn hình MSI GTX 1660 Super VENTUS XS OC (6GB GDDR6, 192-bit, HDMI+DP)', N'Card màn hình MSI GTX 1660 Super VENTUS XS OC (6GB GDDR6, 192-bit, HDMI+DP)', CAST(0xAC7C03F3 AS SmallDateTime), 1, CAST(0xAD0D0399 AS SmallDateTime), 1, 1, 0)
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([ID], [parentId], [accessName], [description], [GropID]) VALUES (1, 0, N'ADMIN', N'Quản trị viên Full quyền', N'ADMIN')
INSERT [dbo].[role] ([ID], [parentId], [accessName], [description], [GropID]) VALUES (2, 1, N'CUSTOMER', N'Khách hàng', N'CUSTOMER')
INSERT [dbo].[role] ([ID], [parentId], [accessName], [description], [GropID]) VALUES (3, 2, N'ACCOUNTANT', N'Kế toán, thống kê', N'ACCOUNTANT')
INSERT [dbo].[role] ([ID], [parentId], [accessName], [description], [GropID]) VALUES (7, 3, N'SALESMAN', N'Nhân viên bán hàng', N'SALESMAN')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[slider] ON 

INSERT [dbo].[slider] ([ID], [name], [url], [position], [img], [orders], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (3, N'Slider3333', N'slider3333', N'SliderShow', N'slider3333.png', 1, CAST(0xAA110000 AS SmallDateTime), 1, CAST(0xAC7C0362 AS SmallDateTime), 1, 1)
INSERT [dbo].[slider] ([ID], [name], [url], [position], [img], [orders], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (8, N'dddddd', N'dddddd', N'SliderShow', N'dddddd.jpg', 1, CAST(0xAC65033D AS SmallDateTime), 1, CAST(0xAC7C0362 AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[slider] OFF
SET IDENTITY_INSERT [dbo].[topic] ON 

INSERT [dbo].[topic] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (1, N'Giới Thiệu', N'gioi-thieu', 0, 1, N'metakey', N'metadesc', CAST(0xAA110000 AS SmallDateTime), 9, CAST(0xAD0D039A AS SmallDateTime), 1, 1)
INSERT [dbo].[topic] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (16, N'Tin Tức', N'tin-tuc', 0, 1, N'a', N'a', CAST(0xAC650345 AS SmallDateTime), 1, CAST(0xAD0D039A AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[topic] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (1, N'Nguyễn Văn A', N'admin', N'4QrcOUm6Wau+VuBX8g+IPg==', N'abc@gmail.com', N'Nam', N'0975271384', N'ádasd', 0, CAST(0xABB703B1 AS SmallDateTime), 1, CAST(0xAC1D02AD AS SmallDateTime), 1, 1)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (6, N'Nguyễn Văn A', N'khachhang1', N'4QrcOUm6Wau+VuBX8g+IPg==', N'vanhungdev@gmail.com', N'Nam', N'0975271384', N'bav', 1, CAST(0xABB703BA AS SmallDateTime), 6, CAST(0xAC1D02A8 AS SmallDateTime), 1, 1)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (8, N'Nguyễn Văn A', N'khachhang2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'abc@gmail.com', N'Nam', N'1231231231', N'ádasd', 1, CAST(0xABB503EB AS SmallDateTime), 1, CAST(0xAC1D02AD AS SmallDateTime), 1, 1)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (14, N'Nguyễn Văn A', N'khachhang123', N'4QrcOUm6Wau+VuBX8g+IPg==', N'abc@gmail.com', N'Nam', N'0975271384', N'ádasd', 1, CAST(0xABB503F1 AS SmallDateTime), 1, CAST(0xABB503F1 AS SmallDateTime), 1, 0)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (15, N'Nguyễn Văn A', N'khachhang112', N'i5YoL5fbmnteeBT/9l4G1A==', N'abc@gmail.com', N'nam', N'0975271384', N'defalt.png', 1, CAST(0xABD80249 AS SmallDateTime), 1, CAST(0xAC1D02A8 AS SmallDateTime), 1, 1)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (16, N'Huynh Minh Nhat', N'Fpt telecom', N'4QrcOUm6Wau+VuBX8g+IPg==', N'vanhungdev@gmail.com', N'nam', N'0975271384', N'defalt.png', 1, CAST(0xAD7E04FF AS SmallDateTime), 1, CAST(0xAD7E04FF AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[category] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [created_at]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT ((1)) FOR [created_by]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [updated_at]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT ((1)) FOR [updated_by]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[contact] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [created_at]
GO
ALTER TABLE [dbo].[contact] ADD  DEFAULT ((1)) FOR [created_by]
GO
ALTER TABLE [dbo].[contact] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [updated_at]
GO
ALTER TABLE [dbo].[contact] ADD  DEFAULT ((1)) FOR [updated_by]
GO
ALTER TABLE [dbo].[menu] ADD  DEFAULT (NULL) FOR [link]
GO
ALTER TABLE [dbo].[menu] ADD  DEFAULT (NULL) FOR [tableid]
GO
ALTER TABLE [dbo].[menu] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [created_at]
GO
ALTER TABLE [dbo].[menu] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[menu] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [updated_at]
GO
ALTER TABLE [dbo].[menu] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[ordersdetail] ADD  DEFAULT ((1)) FOR [priceSale]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT (NULL) FOR [topid]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT (NULL) FOR [detail]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT (NULL) FOR [img]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ('post') FOR [type]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [created_at]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ((1)) FOR [created_by]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [updated_at]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ((1)) FOR [updated_by]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [created_at]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((1)) FOR [created_by]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [updated_at]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((1)) FOR [updated_by]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (NULL) FOR [sold]
GO
ALTER TABLE [dbo].[slider] ADD  DEFAULT ((1)) FOR [orders]
GO
ALTER TABLE [dbo].[slider] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [created_at]
GO
ALTER TABLE [dbo].[slider] ADD  DEFAULT ((1)) FOR [created_by]
GO
ALTER TABLE [dbo].[slider] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [updated_at]
GO
ALTER TABLE [dbo].[slider] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[slider] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[topic] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [created_at]
GO
ALTER TABLE [dbo].[topic] ADD  DEFAULT ((1)) FOR [created_by]
GO
ALTER TABLE [dbo].[topic] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [updated_at]
GO
ALTER TABLE [dbo].[topic] ADD  DEFAULT ((1)) FOR [updated_by]
GO
ALTER TABLE [dbo].[topic] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ('Nam') FOR [gender]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT (NULL) FOR [img]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [created_at]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((1)) FOR [created_by]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [updated_at]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((1)) FOR [updated_by]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[contact]  WITH CHECK ADD  CONSTRAINT [FK_contact_userId] FOREIGN KEY([created_by])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[contact] CHECK CONSTRAINT [FK_contact_userId]
GO
ALTER TABLE [dbo].[menu]  WITH CHECK ADD  CONSTRAINT [FK_menu_to_userId] FOREIGN KEY([created_by])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[menu] CHECK CONSTRAINT [FK_menu_to_userId]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_to_user] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_to_user]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_to_topic] FOREIGN KEY([topid])
REFERENCES [dbo].[topic] ([ID])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_to_topic]
GO
ALTER TABLE [dbo].[slider]  WITH CHECK ADD  CONSTRAINT [FK_slider_userId] FOREIGN KEY([created_by])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[slider] CHECK CONSTRAINT [FK_slider_userId]
GO
