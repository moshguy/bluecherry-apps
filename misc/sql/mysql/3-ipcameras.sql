CREATE TABLE ipCameraDriver (
	id integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name varchar(32),
	media_url varchar(32),
	mjpeg_url varchar(32),
	UNIQUE (name)
);

--
-- Drivers for ipCameras
--

-- Percent replacements as follows:
-- %u == user info (e.g. 'user:password')
-- %h == host or IP address
-- %p == "user supplied port" or default "port" for protocol type
-- %{foo}f == "user supplied path" or "foo"
INSERT INTO ipCameraDriver (name, protocol, media_path, mjpeg_path) VALUES
  ('RTSP-GENERIC', 'rtsp://%u@%h:%p%{}f', 'http://%u@%h:%p%{}f'),
  ('RTSP-AXIS-v1', 'rtsp://%u@%h:%p%{/mpeg4/media.amp}f',
   'http://%u@%h:%p%{/mjpg/video.mjpg}f');

--
-- IP Devices
--
CREATE TABLE ipCameras (
        id integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
        type varchar(30),
        manufacturer varchar(30),
        model varchar(30),
        compression varchar(30),
        resolutions varchar(250),
	driver varchar(32) NOT NULL DEFAULT 'RTSP-GENERIC',
	FOREIGN KEY (driver) REFERENCES ipCameraDriver(name)
);

INSERT INTO ipCameras (type, manufacturer, model, compression,
		       resolutions, driver) VALUES
  ('Camera', 'ACTi', 'CAM-5201', 'MPEG4', '720x480-30,352x240-30,160x112-30',
   'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-5221', 'MPEG4', '720x480-30,352x240-30,160x112-30',
   'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-5301', 'MPEG4', '720x480-30,352x240-30,160x112-30',
   'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-5321', 'MPEG4', '720x480-30,352x240-30,160x112-30',
   'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-7300', 'MPEG4', '720x480-30,352x240-30,160x112-30',
   'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-7301', 'MPEG4', '720x480-30,352x240-30,160x112-30',
   'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-7321', 'MPEG4', '720x480-30,352x240-30,160x112-30',
   'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-7322', 'MPEG4', '720x480-30,352x240-30,160x112-30',
   'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-6510', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-6610', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-6620', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'CAM-6630', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-1011', 'MPEG4', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-1231', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-1232', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-1311', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-1431', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-1432', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-1511', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3001', 'MPEG4', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3011', 'MPEG4', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3211', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3311', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3401', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3411', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3511', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3601', 'MPEG4', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3603', 'MPEG4', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3701', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-3703', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-7411', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-7511', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-4000', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-4200', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-4201', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-5001', 'MPEG4', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-5601', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-5611', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-5711', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-8201', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-8211', 'MPEG4', '1280x1024-8,1280x720-10,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'ACM-8511', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-1231', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-1232', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-1511', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-3001', 'MPEG4,H.264', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-3011', 'MPEG4,H.264', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-3401', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-3411', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-3511', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-4101', 'MPEG4,H.264', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-4301', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-7411', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-4301', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-5001', 'MPEG4,H.264', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-5311', 'MPEG4,H.264', '1280x960-15,1280x720-30,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-5312', 'MPEG4,H.264', '1280x960-15,1280x720-30,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-5601', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-5611', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-7011', 'MPEG4,H.264', '640x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-7411', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'ACTi', 'TCM-7811', 'MPEG4,H.264', '1280x1024-18,1280x720-26,640x480-30,320x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'SED-2120', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'SED-2140', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'SED-2610', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'ACD-2100', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'ACD-2100T', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'ACD-2200', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'ACD-2300', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'ACD-2400', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'ACD-3100', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'ACD-2000Q', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'ACD-2000QT', 'MPEG4,H.264', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'TCD-2100', 'MPEG4,H.264', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Video Server', 'ACTi', 'TCD-2500', 'MPEG4', '720x480-30,352x240-30,160x112-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '209FD', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '209FD-R', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '209MFD', 'MPEG4,MJPEG', '1280x1024-12,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '209MFD-R', 'MPEG4,MJPEG', '1280x1024-12,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'M3011', 'MPEG4,H264,MJPEG', '1280x800-30,1280x720-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'M3014', 'MPEG4,H264,MJPEG', '1280x800-30,1280x720-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '216FD', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '216FD-V', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P3301', 'H264,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P3301-V', 'H264,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '216MFD', 'MPEG4,MJPEG', '1280x1024-12,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '216MFD-V', 'MPEG4,MJPEG', '1280x1024-12,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '225FD', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P3343', 'H264,MJPEG', '800x600-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P3343-V', 'H264,MJPEG', '1280x800-30,1280x720-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P3344', 'H264,MJPEG', '1280x800-30,1280x720-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P3344-V', 'H264,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P3343-VE', 'H264,MJPEG', '1280x800-30,1280x720-30,800x600-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P3344-VE', 'H264,MJPEG', '1280x800-30,1280x720-30,800x600-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '207W', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '207MW', 'MPEG4,MJPEG', '1280x1024-12,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'M1011', 'MPEG4,H264,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'M1011-W', 'MPEG4,H264,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'M1031', 'MPEG4,H264,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'M1031-W', 'MPEG4,H264,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '210', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-AXIS-v1'),
  ('Camera', 'Axis', '210A', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-AXIS-v1'),
  ('Camera', 'Axis', 'P1311', 'MPEG4,H264,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '211', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-AXIS-v1'),
  ('Camera', 'Axis', '211A', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-AXIS-v1'),
  ('Camera', 'Axis', '211W', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '211M', 'MPEG4,MJPEG', '1280x1024-12,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '221', 'MPEG4,MJPEG', '640x480-45,480x360-60', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P1343', 'H264,MJPEG', '800x600-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P1344', 'H264,MJPEG', '1280x800-30,1280x720-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '223M', 'H264,MJPEG', '1600x1200-9,1600x900-12,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P1346', 'H264,MJPEG', '1920x1080-30,1600x1200-30,2048x1536-20,1600x900-12,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'Q1755', 'H264,MJPEG', '1920x1080-30,1600x1200-301280x720-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '212PTZ', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '212PTZ-V', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '213PTZ', 'MPEG4,MJPEG', '704x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '214PTZ', 'MPEG4,MJPEG', '704x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '215PTZ', 'MPEG4,MJPEG', '704x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '215PTZ-E', 'MPEG4,MJPEG', '704x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'P5534', 'H264,MJPEG', '1280x720-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '232D+', 'H264,MJPEG', '704x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', '233D', 'H264,MJPEG', '704x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'Q6032-E', 'H264,MJPEG', '704x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'Q1910', 'H264,MJPEG', '160x128-8', 'RTSP-GENERIC'),
  ('Camera', 'Axis', 'Q1910-E', 'H264,MJPEG', '160x128-8', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', '241S', 'MPEG4,MJPEG', '704x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', 'M7001', 'H264,MJPEG', '720x480-21,720x288-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', '243SA', 'MPEG4,MJPEG', '704x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', '247S', 'MPEG4,MJPEG', '704x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', 'Q7401', 'H264,MJPEG', '720x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', '240Q', 'MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', '241Q', 'MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', '241QA', 'MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', 'Q7404', 'H264,MJPEG', '720x480-30,640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', '243Q', 'MPEG4,MJPEG', '640x480-30,320x240-30', 'RTSP-GENERIC'),
  ('Video Server', 'Axis', 'Q7406', 'H264,MJPEG', '720x480-30,640x480-30,320x240-30');
