package cn.slkj.jzlj.service.impl;

import cn.slkj.jzlj.dao.GroupMapper;
import cn.slkj.jzlj.model.Group;
import cn.slkj.jzlj.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * Created by maxh on 2016-11-20.
 */
@Repository
public class GroupServiceImpl implements GroupService {
    @Autowired
    private GroupMapper mapper;

    @Override
    public List<Group> getAll(HashMap<String, Object> hashMap) {
        return mapper.getAll(hashMap);
    }

    @Override
    public int save(Group group) {
        return mapper.save(group);
    }
}
