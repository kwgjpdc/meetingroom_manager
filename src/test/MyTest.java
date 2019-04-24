import com.bcsd.dao.ReMeetRoomDao;
import com.bcsd.entity.MeetRoom;
import com.bcsd.service.MeetRoomService;
import com.bcsd.service.ReMeetRoomService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-application.xml")
public class MyTest {

    @Autowired
    private ReMeetRoomService reMeetRoomService;

    @Autowired
    private ReMeetRoomDao reMeetRoomDao;
    @Test
    public void findAll()  {
       // List<MeetRoom> all = meetRoomService.findAll();

//        List<MeetRoom> all= meetRoomService.findAll();
//        MeetRoom one =meetRoomService.findOne("00585598-6019-4C51-A881-A050CEBCF6CB");

        List<MeetRoom> all= reMeetRoomService.findRoom("c5539aa3-af34-463d-9415-1a7f8ae42727","YMTC-OS1","2");
 //       List<MeetRoom> all=reMeetRoomService.findFloor("c5539aa3-af34-463d-9415-1a7f8ae42727","YMTC-OS1");
                System.out.println(all);

    }
}
