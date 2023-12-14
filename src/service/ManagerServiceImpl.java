package service;

import dao.ManagerDaoImpl;
import service.IManagerService;
import vo.ManagerVO;

public class ManagerServiceImpl implements IManagerService {
   //싱글톤 
   private static ManagerServiceImpl service;
   private ManagerDaoImpl dao;
   
   private ManagerServiceImpl() {
      dao= ManagerDaoImpl.getInstance();
   }
   public static ManagerServiceImpl getInstance() {
      if(service== null)service= new ManagerServiceImpl();
      return service;
   }

   @Override
   public ManagerVO loginMg(ManagerVO vo) {
      
      return dao.loginMg(vo);
   }

   @Override
   public ManagerVO findIdMg(ManagerVO vo) {
      
      return dao.findIdMg(vo);
   }

   @Override
   public ManagerVO findPwMg(ManagerVO vo) {
      
      return dao.findPwMg(vo);
   }

   @Override
   public int randomPw(ManagerVO vo) {
      
      return dao.randomPw(vo);
   }

}