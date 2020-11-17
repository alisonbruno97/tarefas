package com.qintess.tarefas.controllers;

import java.time.LocalDate;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qintess.tarefas.TarefasApplication;
import com.qintess.tarefas.controllers.dto.TarefaDto;
import com.qintess.tarefas.entidades.Tarefa;
import com.qintess.tarefas.repositorios.TarefaRepository;

@Controller
@RequestMapping("/tarefa")
public class TarefaController {

	@Autowired
	private TarefaRepository tarefaRepository;
	
	@GetMapping("/novo")
	public String novo(Model model) {
		
		model.addAttribute("tarefa", new TarefaDto());
		
		return "tarefa/cadastra";
	}
	
	@PostMapping("/cadastra")
	public String cadastra(@Valid TarefaDto tarefaDto, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("erro", "Erro ao tentar cadastrar a tarefa: " + result.getAllErrors().get(0).getDefaultMessage());
			model.addAttribute("tarefa", tarefaDto);
			return "tarefa/cadastra";
		}
		
		Tarefa tarefa = tarefaDto.converter();
		
		System.out.println(tarefa);
		
		tarefaRepository.save(tarefa);
		
		return "redirect:/";
	}
	
	@GetMapping("/deleta/{id}")
	public String deleta(@PathVariable int id, RedirectAttributes redirecAtt) {
		
		tarefaRepository.deleteById(id);
		
		redirecAtt.addFlashAttribute("sucesso", "Tarefa " + id + " removida com sucesso.");
		
		return "redirect:/";
	}
	
	@GetMapping("/edita/{id}")
	public String edita(@PathVariable int id, Model model) {
		
		var tarefaOptional = tarefaRepository.findById(id);
		
		if(tarefaOptional.isPresent()) {
			
			var tarefa = tarefaOptional.get();
			
			var tarefaDto = new TarefaDto(tarefa);
			
			model.addAttribute("tarefa", tarefaDto);
		}
		
		return "tarefa/cadastra";
	}
	
	@GetMapping("/finaliza/{id}")
	public String finaliza(@PathVariable int id, RedirectAttributes redirecAtt) {
		
		var tarefaOptional = tarefaRepository.findById(id);
		
		if(tarefaOptional.isPresent()) {
			
			var tarefa = tarefaOptional.get();
			
			tarefa.setDataTermino(LocalDate.now());
			tarefa.setFinalizado(true);
			
			tarefaRepository.save(tarefa);
			
			redirecAtt.addFlashAttribute("sucesso", "Tarefa " + id + " finalizada com sucesso.");
			
		} else {
			redirecAtt.addFlashAttribute("erro", "Erro ao finalizar: Tarefa " + id + " não encontrada.");	
		}
		
		return "redirect:/";
	}
}
