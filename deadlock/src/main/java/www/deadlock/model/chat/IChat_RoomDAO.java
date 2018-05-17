package www.deadlock.model.chat;

import java.util.Map;

import deadlock.DAOSTDInter;

public interface IChat_RoomDAO extends DAOSTDInter {
	public boolean chat_room_Check(Map map);
	public boolean crate_room_check(String id);
}
