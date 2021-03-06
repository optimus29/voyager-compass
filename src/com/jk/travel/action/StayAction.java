package com.jk.travel.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jk.travel.dao.StayDAO;
import com.jk.travel.dao.TravelMasterDAO;
import com.jk.travel.model.NotiMsg;
import com.jk.travel.model.Stay;

@WebServlet("/StayAction")
public class StayAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/index.jsp");
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Stay stay = new Stay();

		String vehicle = request.getParameter("vehicleNo");
		vehicle = (vehicle == null) ? "" : vehicle;

		stay.setTravelId(Integer.parseInt(request.getParameter("travelId")));
		stay.setHotelId(Integer.parseInt(request.getParameter("hotelId")));
		stay.setRoomNo(request.getParameter("roomNo"));
		stay.setVehicleNo(vehicle);

		String target = "/admin/EmpStay.jsp?TravelId=" + stay.getTravelId();
		NotiMsg noti = new NotiMsg(NotiMsg.FAIL, "Error occurred while adding stay information.");

		boolean status = new StayDAO().addStay(stay);

		if (status) {
			int workId = new TravelMasterDAO().get(stay.getTravelId()).getWorkId();
			target = "/ViewTravelAction?workId=" + workId;
			noti.setOk("Stay information added successfully.");
		}

		request.getSession().setAttribute("status", noti);
		response.sendRedirect(target);
	}

}
