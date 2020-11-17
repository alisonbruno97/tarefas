package com.qintess.tarefas.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qintess.tarefas.controllers.dto.TarefaDto;
import com.qintess.tarefas.entidades.Tarefa;
import com.qintess.tarefas.repositorios.TarefaRepository;

@Controller
public class HomeController {

	@Autowired
	private TarefaRepository tarefaRepository;
	
	@RequestMapping("")
	public String home(Model model) {
		
		model.addAttribute("tarefasNaoFinalizadas", retornaTarefasDtoByFinalizado(false));
		
		model.addAttribute("tarefasFinalizadas", retornaTarefasDtoByFinalizado(true));
		
		return "index";
	}

	private List<TarefaDto> retornaTarefasDtoByFinalizado(boolean finalizado) {
		
		var tarefasDto = new ArrayList<TarefaDto>();
		
		tarefaRepository.findByFinalizado(finalizado).forEach(t -> {
			tarefasDto.add(new TarefaDto(t));
		});
		
		return tarefasDto;
	}
}
