require("spec_helper")

describe(List) do
  describe('.all') do
    it('starts off with no lists') do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#tasks') do
    it("tells which tasks are in it") do
      test_list = List.create({:name => "list"})
      test_task1 = Task.create({:description => "task1", :list_id => test_list.id, :rank => 5})
      test_task2 = Task.create({:description => "task2", :list_id => test_list.id, :rank => 7})
      expect(test_list.tasks()).to(eq([test_task1, test_task2]))
    end
  end
end
