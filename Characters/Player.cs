using Godot;
using System;

public partial class Player : CharacterBody2D
{
	// 移动速度设置
	[Export] public float MoveSpeed = 200.0f;

	// 用于获取输入方向
	private Vector2 _inputDirection;
	
	public override void _PhysicsProcess(double delta)
	{
		// 获取输入方向
		_inputDirection = Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down");

		// 设置速度
		Velocity = _inputDirection * MoveSpeed;

		// 应用移动
		MoveAndSlide();
	}
}
