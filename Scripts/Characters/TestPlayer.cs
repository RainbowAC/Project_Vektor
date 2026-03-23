using Godot;
using System;

public partial class TestPlayer : CharacterBody2D
{
	// 移动速度设置
	[Export] public float MoveSpeed = 200.0f;
	
	// 用于获取输入方向
	private Vector2 _inputDirection;
	
	public override void _PhysicsProcess(double delta)
	{
		// 获取输入方向
		_inputDirection = Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down");

		// 标准化对角线移动速度，确保各个方向移动速度一致
		if (_inputDirection.Length() > 0)
		{
			_inputDirection = _inputDirection.Normalized();
		}

		// 设置速度
		Velocity = _inputDirection * MoveSpeed;

		// 应用移动
		MoveAndSlide();
	}
}
