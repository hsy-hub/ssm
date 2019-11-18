package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import exception.ParamErrorException;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import pojo.User;
import service.UserDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {
        @Autowired
        UserDao userDao;
        @Autowired
        HttpServletRequest request;


        @RequestMapping("/loginPage.action")
        public String loginPage(){
            return "login";
        }

        //点击"登录"后
        @RequestMapping("/login.action")
        public String Login(User user) throws ParamErrorException {
            String password = user.getPassword();
            if (password.length()<3){
                throw new ParamErrorException();
            }
            HttpSession session = request.getSession();
            User loginUser = userDao.Login(user);
            session.setAttribute("user",loginUser);
            Integer id = loginUser.getId();
            session.setAttribute("id", id);
            String userType = loginUser.getUserType();
            session.setAttribute("userType", userType);
            if (loginUser != null){
                //重定向
                return "redirect:frame.action";//内部转发不用redirect（直接写frame）
            }else{
                // model.addAttribute("msg","用户名或密码错误！");
                //转发
                return "login";
            }

        }

        //登录成功
        @RequestMapping("/frame.action")
        public String frame(){
            return "frame" ;
        }

        //点击"修改密码"后
        @RequestMapping("/updatePwd.action")
        public ModelAndView updatePwd(){
            // HttpSession session = request.getSession();
            // session.setAttribute("list",userList);
            ModelAndView mad = new ModelAndView();
            List<User> userList = userDao.getUserList(null);//调用getUserList方法
            mad.addObject("list",userList);
            mad.setViewName("updatePwd");//此时不能用redirect
            return mad;
        }

        //确认“修改”后
        @RequestMapping("/userUpdatePs.action")
        public String userUpdatePs(User user){
//            ModelAndView mad = new ModelAndView();
//            boolean b = userDao.checkPassword(user);
//            if (b==false){
//                User reuser = new User();
//                boolean modifyPs = userDao.modifyPs(reuser);
//                mad.setViewName("userList");
//            }else{
//                mad.setViewName("updatePwd");
//            }
//            return mad;

            Integer id = (Integer) request.getSession().getAttribute("id");
            user.setId(id);
            userDao.modifyPs(user);
            return "redirect:userList.action";
        }

        //点击“用户管理”or"查询"后
        @RequestMapping("/userList.action")
        public ModelAndView userList(User user,@RequestParam(required = false,defaultValue = "1",value = "page")int page){
            ModelAndView mad = new ModelAndView();
            //首先是设置第几页，第二个参数是每页的记录数
            PageHelper.startPage(page,5);
            List<User> userList = userDao.getUserList(user);//调用getUserList方法
            PageInfo pageinfo = new PageInfo(userList);
            mad.addObject("searchName",user.getName() );
            mad.addObject("pageinfo",pageinfo);
            mad.setViewName("userList");
            return mad;
        }

    //添加用户 点击"保存"后
    @RequestMapping("/registerUser.action")
    public ModelAndView registerUser(User user,@RequestParam(required = false,defaultValue = "1",value = "page")int page){
        ModelAndView mad = new ModelAndView();
        PageHelper.startPage(page,5);
        boolean register = userDao.RegisterUser(user);//用Register进行判断
        List<User> userList = userDao.getUserList(null);
        PageInfo pageinfo = new PageInfo(userList);
        if (register){//注册成功
            mad.addObject("pageinfo",pageinfo);
            mad.setViewName("userList");
        }else{//注册失败
            mad.setViewName("userAdd");
        }
        return mad;
    }

    //点击"用户名"后
    @RequestMapping("/selectUserViewByid.action")
    public String selectUserViewByid(Integer id,Model model){
        //Integer id = Integer.parseInt(request.getParameter("id"));
        User user = userDao.getUserByid(id);
            if (user != null){
                model.addAttribute("user",user);
                return "userView";//回填页面数据
            }else{
                return "userList";//跳转至列表页面
            }
    }

    //点击"修改"后
    @RequestMapping("/selectUserByid.action")
    public ModelAndView selectUserByid(Integer id,Model model){
            ModelAndView mad = new ModelAndView();
        User user = userDao.getUserByid(id);
            if (user != null){
                mad.addObject("user",user);
                mad.setViewName("userUpdate");//回填页面数据
            }else{
                model.addAttribute("errorMsg","修改失败");
                mad.setViewName("userList");//跳转至列表页面
            }
            return mad;
    }

    //进入userUpdate页面 确认"修改"后
    @RequestMapping("/userUpdate.action")
    public ModelAndView userUpdate(User user, MultipartFile pictureFile) throws IOException {
            ModelAndView mad = new ModelAndView();
            String filname = UUID.randomUUID().toString().replaceAll("-","");
            String extension = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
            filname = filname +"."+ extension;
            pictureFile.transferTo(new File("D:\\upload\\" + filname));
            user.setHeadpath(filname);
        boolean update = userDao.updateUser(user);
        if (update){//修改成功
            mad.setViewName("redirect:userList.action");
        }else{//修改失败
            mad.setViewName("userUpdate");
        }
        return mad;
    }


    //点击"删除"后
    @RequestMapping("/deleteUser.action")
    public String deleteUser(Integer id){
        boolean delete = userDao.deleteUserByid(id);//用deleteUserByid进行判断
        return "redirect:userList.action";//跳转至列表页面
    }



    @RequestMapping("/checkUserName.action")
    @ResponseBody
    public String checkUserName(String name){
            int i = userDao.checkUserName(name);
          return (i > 0) ? "用户名被占用" : "用户名可用";
    }


    @RequestMapping("/search.action")
    @ResponseBody
    public List<User> search(@RequestBody User user){
            List<User> userList = userDao.search(user);
            return userList;
    }
}

