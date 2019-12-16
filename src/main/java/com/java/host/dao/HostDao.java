package com.java.host.dao;

import java.io.File;

import com.java.file.dto.FileDto;
import com.java.host.dto.HostDto;

public interface HostDao {

	public int subImgUpload(FileDto fileDto);

	public int hostRegister(HostDto hostDto);

}
