package com.hobbycam.level.model;

import java.util.List;

public interface LevelDAO {

	public List getLevelList();
	public int updateLevel(LevelDTO dto);
	public LevelDTO getUpdateLevelInfo(int lev_idx);

}
